<template>
  <div class="l-title--indicators">
    <div
      v-for="n in count"
      :key="n"
      :class="['indicator', indicatorIndex === n ? 'selected' : '']"
      @mouseenter="selectIndicator(n)"
    ></div>
  </div>
</template>
<script>
export default {
  props: {
    count: Number,
    currentActive: Number
  },

  data() {
    return {
      selectedActive: 1
    };
  },

  computed: {
    indicatorIndex: {
      get: function() {
        return this.currentActive ? (this.currentActive + 1) : this.selectedActive;
      },

      set: function(newValue) {
        this.selectedActive = newValue;
      }
    }
  },

  methods: {
    selectIndicator(val) {
      this.indicatorIndex = val;
      this.$emit('selected', val);
    }
  }
};
</script>
