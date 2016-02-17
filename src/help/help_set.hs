<?xml version='1.0' encoding='UTF-8'  ?>
<!DOCTYPE helpset
  PUBLIC "-//Sun Microsystems Inc.//DTD JavaHelp HelpSet Version 1.0//EN"
         "http://java.sun.com/products/javahelp/helpset_1_0.dtd">
 

<helpset version="1.0">
        <title>Ayuda para dar de altas Empresas</title>
        <maps>
                <!-- Pagina por defecto al mostrar la ayuda -->
                <homeID>menu</homeID>
                <!-- Que mapa deseamos -->
                <mapref location="map.jhm"/>
        </maps>

        <!-- Las Vistas que deseamos mostrar en la ayuda -->
        <view>
                <name>Menu</name>
                <label>menu</label>
                <type>javax.help.TOCView</type>
                <data>toc.xml</data>
        </view>

  <view>
    <name>Indice de busqueda</name>
    <label>Buscar</label>
    <type>javax.help.IndexView</type>
    <data>indice.xml</data>
  </view>
  
  <view>
    <name>Buscar</name>
    <label>Buscar</label>
    <type>javax.help.SearchView</type>
    <data engine="com.sun.java.help.search.DefaultSearchEngine">
      JavaHelpSearch
    </data>
  </view>
  
</helpset>

