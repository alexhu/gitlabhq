<script>
import tooltip from '../../directives/tooltip';
import icon from '../icon.vue';

export default {
  components: {
    icon,
  },
  directives: {
    tooltip,
  },
  props: {
    buttonTitle: {
      type: String,
      required: true,
    },
    icon: {
      type: String,
      required: true,
    },
    tag: {
      type: String,
      required: true,
    },
    tagBlock: {
      type: String,
      required: false,
      default: '',
    },
    tagSelect: {
      type: String,
      required: false,
      default: '',
    },
    prepend: {
      type: Boolean,
      required: false,
      default: false,
    },
  },
};
</script>

<template>
  <button
    v-tooltip
    :data-md-tag="tag"
    :data-md-select="tagSelect"
    :data-md-block="tagBlock"
    :data-md-prepend="prepend"
    :title="buttonTitle"
    :aria-label="buttonTitle"
    type="button"
    class="toolbar-btn js-md"
    tabindex="-1"
    data-container="body"
  >
    <icon
      :name="icon"
    />
  </button>
</template>
