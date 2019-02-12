import navConfig from './nav.config.json';
import demoConfig from './demo.config.json';
import langs from './i18n/route.json';

const LOAD_MAP = {
  'zh-CN': name => {
    return r => require.ensure([], () =>
      r(require(`./pages/zh-CN/${name}.vue`)),
    'zh-CN');
  },
  'en-US': name => {
    return r => require.ensure([], () =>
      r(require(`./pages/en-US/${name}.vue`)),
    'en-US');
  },
  'es': name => {
    return r => require.ensure([], () =>
      r(require(`./pages/es/${name}.vue`)),
    'es');
  }
};

const INDEX_MAP = {
  'zh-CN': {
    'component': 0,
    'demo': 3
  },
  'en-US': {
    'component': 1,
    'demo': 4
  },
  'es': {
    'component': 2,
    'demo': 5
  }
};

const REDIRECT_PATH_MAP = {
  'component': 'installation',
  'demo': 'console'
};

const load = function(lang, path) {
  return LOAD_MAP[lang](path);
};

const LOAD_DOCS_MAP = {
  'zh-CN': path => {
    return r => require.ensure([], () =>
      r(require(`./docs/zh-CN${path}.md`)),
    'zh-CN');
  },
  'en-US': path => {
    return r => require.ensure([], () =>
      r(require(`./docs/en-US${path}.md`)),
    'en-US');
  },
  'es': path => {
    return r => require.ensure([], () =>
      r(require(`./docs/es${path}.md`)),
    'es');
  }
};

const loadDocs = function(lang, path) {
  return LOAD_DOCS_MAP[lang](path);
};

const LOAD_DEMOS_MAP = {
  'zh-CN': path => {
    return r => require.ensure([], () =>
      r(require(`./demos/zh-CN${path}`)),
    'zh-CN');
  },
  'en-US': path => {
    return r => require.ensure([], () =>
      r(require(`./demos/en-US${path}`)),
    'en-US');
  },
  'es': path => {
    return r => require.ensure([], () =>
      r(require(`./demos/es${path}`)),
    'es');
  }
};

const loadDemos = function(lang, path) {
  return LOAD_DEMOS_MAP[lang](path);
};

const registerRoute = (config, route, model) => {
  Object.keys(config).forEach((lang) => {
    let navs = config[lang];
    route.push({
      path: `/${ lang }/${ model }`,
      redirect: `/${ lang }/${ model }/${REDIRECT_PATH_MAP[model]}`,
      component: load(lang, model),
      children: []
    });
    navs.forEach(nav => {
      if (nav.href) return;
      if (nav.groups) {
        nav.groups.forEach(group => {
          group.list.forEach(nav => {
            addRoute(nav, lang, model);
          });
        });
      } else if (nav.children) {
        nav.children.forEach(nav => {
          addRoute(nav, lang, model);
        });
      } else {
        addRoute(nav, lang, model);
      }
    });
  });
  function addRoute(page, lang, model) {
    var component = null;
    // TODO 将来模块多了改为switch
    if (model === 'component') {
      component = page.path === '/changelog'
        ? load(lang, 'changelog')
        : loadDocs(lang, page.path);
    } else if (model === 'demo') {
      component = loadDemos(lang, page.path);
    }

    let child = {
      path: page.path.slice(1),
      meta: {
        title: page.title || page.name,
        description: page.description,
        lang
      },
      name: `${model}-${lang}${page.name || page.title}`,
      component: component.default || component
    };

    route[INDEX_MAP[lang][model]].children.push(child);
  }

  return route;
};

let route = [];
registerRoute(navConfig, route, 'component');
registerRoute(demoConfig, route, 'demo');

const generateMiscRoutes = function(lang) {
  let guideRoute = {
    path: `/${ lang }/guide`, // 指南
    redirect: `/${ lang }/guide/design`,
    component: load(lang, 'guide'),
    children: [{
      path: 'design', // 设计原则
      name: 'guide-design' + lang,
      meta: { lang },
      component: load(lang, 'design')
    }, {
      path: 'nav', // 导航
      name: 'guide-nav' + lang,
      meta: { lang },
      component: load(lang, 'nav')
    }]
  };

  let resourceRoute = {
    path: `/${ lang }/resource`, // 资源
    meta: { lang },
    name: 'resource' + lang,
    component: load(lang, 'resource')
  };

  let indexRoute = {
    path: `/${ lang }`, // 首页
    meta: { lang },
    name: 'home' + lang,
    component: load(lang, 'index')
  };

  return [guideRoute, resourceRoute, indexRoute];
};

langs.forEach(lang => {
  route = route.concat(generateMiscRoutes(lang.lang));
});

route.push({
  path: '/play',
  name: 'play',
  component: require('./play/index.vue')
});

let userLanguage = localStorage.getItem('ELEMENT_LANGUAGE') || window.navigator.language || 'en-US';
let defaultPath = '/en-US';
if (userLanguage.indexOf('zh-') !== -1) {
  defaultPath = '/zh-CN';
} else if (userLanguage.indexOf('es') !== -1) {
  defaultPath = '/es';
}

route = route.concat([{
  path: '/',
  redirect: defaultPath
}, {
  path: '*',
  redirect: defaultPath
}]);

export default route;
