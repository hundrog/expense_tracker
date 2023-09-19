<template>
  <div v-for="category in categories" :key="category.id" class="pa-4">
    <v-card :text="category.name" :color="category.color"/>
  </div>
</template>

<script setup>
defineProps(["categories"]);
</script>
