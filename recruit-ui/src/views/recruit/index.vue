<template>
  <div>
    <Nav/>
    <router-view/>
  </div>
</template>

<script>
import Nav from '@/views/recruit/components/Nav'
import User from '@/views/system/user/profile'

export default {
  name: 'Index',
  components: { User, Nav },
  created() {
  },
}
</script>

<!-- 样式 -->
<style scoped>
</style>
