<script setup lang="ts">
import { ref } from 'vue'

defineProps<{ msg: string }>()

const text = ref('')
</script>

<template>
  <h1>{{ msg }}</h1>

  <input v-thaana v-model="text" type="text" />
  <p>{{ text }}</p>
</template>

<style scoped>
.read-the-docs {
  color: #888;
}
</style>
