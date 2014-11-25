 Shader "MQMTech/Wall" {
    Properties {
      _MainTex ("Texture", 2D) = "white" {}
      _Color ("Color", Color) = (1, 1, 1, 1)
      _SecondColor ("Second Color", Color) = (1, 1, 1, 1)
      _SecondColorYMax("_SecondColorYMax", Float) = 0
      _SecondColorYMin("_SecondColorYMin", Float) = 0
    }
    SubShader {
      Tags { "RenderType" = "Opaque" }
      CGPROGRAM
      #pragma surface surf Lambert
      
      struct Input {
          float2 uv_MainTex;
      };
      
      sampler2D _MainTex;
      fixed4 _Color;
      fixed4 _SecondColor;
      half _SecondColorYMin;
      half _SecondColorYMax;
      
      void surf (Input IN, inout SurfaceOutput o)
      {
          o.Albedo = tex2D (_MainTex, IN.uv_MainTex).rgb * _Color.rgb;
          if(IN.uv_MainTex.y > _SecondColorYMin && IN.uv_MainTex.y < _SecondColorYMax)
          {
          	o.Albedo = _SecondColor;
          }
          
//          half2 p = IN.uv_MainTex * 2 - 1;
//          p.x *= 1.8;
//          
//          if(length(p) < 1.0)
//          {
//          	o.Albedo = _SecondColor;
//  		  }
      }
      ENDCG
    }
    Fallback "Diffuse"
  }