<template>
<div>
  <Banner/>
  <Search/>
  <IndexMain/>
  <Footer/>
</div>
</template>

<script>
import Search from '@/views/recruit/components/Search'
import Banner from '@/views/recruit/components/Banner'
import IndexMain from '@/views/recruit/indexChild/main'
import Footer from '@/views/recruit/components/Footer'

export default {
  name: 'Index',
  components: { Footer, IndexMain, Banner, Search },
}
</script>

<style scoped>

</style>
