<template>
    <b-card bg-variant="white" class="home">    
      
        <b-card  align="left" >
            
            <b-card >
                <b-card-title class="h2"> Temporary SetUp page </b-card-title>
            </b-card>   

        </b-card>
    </b-card>
</template>

<script lang="ts">
    import { Component, Vue } from 'vue-property-decorator';
    import { namespace } from 'vuex-class'

    @Component
    export default class SetUp extends Vue {

    }
</script>

<style scoped>   

    .card {
        border: white;
    }

</style>