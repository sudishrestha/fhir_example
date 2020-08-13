/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fhir.controller;

import java.io.IOException;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.X509Certificate;
import java.util.Arrays;
import javax.net.ssl.SSLContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdk.vm.ci.meta.Constant;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.HttpClient;
import org.apache.http.conn.ssl.NoopHostnameVerifier;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.TrustStrategy;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author sudis
 */
@Controller
public class fhirController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String printWelcome(ModelMap model) {
        model.addAttribute("message", "FHIR CODE EXAMPLES");
        return "fhir";
    }

    @RequestMapping(value = "/checkEligibility", method = RequestMethod.POST)
    public ModelAndView checkEligibility(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException, KeyStoreException, NoSuchAlgorithmException, KeyManagementException {
//        SSLUtil.turnOffSslChecking();
        System.out.print("Inside check eligibility ");
        String id = request.getParameter("insuree_id");
        String uri = Constants.api_endpoint + "/api/api_fhir/EligibilityRequest/";
        System.setProperty("https.protocol", "TLSv1.2,TLSv1.1,TLSv1");

        String input = "{\"resourceType\":\"EligibilityRequest\",\"patient\":{\"reference\":\"Patient\\/" + id + "\"}}";
//        JSONObject requests = new JSONObject();
//        requests.put("resourceType", "EligibilityRequest");

//        System.out.print(requests.toString());
        RestTemplate restTemplate = new RestTemplate(getClientHttpRequestFactory());
        HttpHeaders headers = new HttpHeaders();
//        headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
        headers.set("Content-Type", "application/json");
        headers.set("remote-user", "openimis");
        HttpEntity<String> entity = new HttpEntity<String>(input, headers);
        String answer = "";
        try {
            ResponseEntity<String> result = restTemplate.exchange(uri, HttpMethod.POST, entity, String.class);
            answer = result.toString();
//            answer = restTemplate.postForObject(uri, entity, String.class);
        } catch (Exception ex) {
            answer = ex.toString();
        }

        System.out.print("Insuree id is " + answer);
        ModelAndView model = new ModelAndView();
        model.setViewName("fhir");
        model.addObject("output", answer);
        model.addObject("input", input);
        return model;
    }
    
    
      @RequestMapping(value = "/Patient", method = RequestMethod.POST)
    public ModelAndView viewPatient(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException, KeyStoreException, NoSuchAlgorithmException, KeyManagementException {
//        SSLUtil.turnOffSslChecking();
        System.out.print("Inside view Patient");
        String id = request.getParameter("insuree_id");
        String uri = Constants.api_endpoint + "/api/api_fhir/Patient/";
        System.setProperty("https.protocol", "TLSv1.2,TLSv1.1,TLSv1");

             RestTemplate restTemplate = new RestTemplate(getClientHttpRequestFactory());
        HttpHeaders headers = new HttpHeaders();
//        headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
        headers.set("Content-Type", "application/json");
        headers.set("remote-user", "openimis");
           String input = "";
            HttpEntity<String> entity;
        if(!id.isEmpty())
        {
       input = "{\"resourceType\":\"EligibilityRequest\",\"patient\":{\"reference\":\"Patient\\/" + id + "\"}}";
       entity = new HttpEntity<String>(input, headers);
        }
         else
        {
       entity = new HttpEntity<String>( headers);
        }
        String answer = "";
        try {
            ResponseEntity<String> result = restTemplate.exchange(uri, HttpMethod.GET, entity, String.class);
            answer = result.toString();
//            answer = restTemplate.postForObject(uri, entity, String.class);
        } catch (Exception ex) {
            answer = ex.toString();
        }

        System.out.print("Insuree id is " + answer);
        ModelAndView model = new ModelAndView();
        model.setViewName("fhir");
        model.addObject("output_patient", answer);
        model.addObject("input_patient", input);
        return model;
    }
    
    
      @RequestMapping(value = "/Location", method = RequestMethod.POST)
    public ModelAndView viewLocation(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException, KeyStoreException, NoSuchAlgorithmException, KeyManagementException {
//        SSLUtil.turnOffSslChecking();
        System.out.print("Inside view Patient");
        String id = request.getParameter("insuree_id");
        String uri = Constants.api_endpoint + "/api/api_fhir/Location/";
        System.setProperty("https.protocol", "TLSv1.2,TLSv1.1,TLSv1");

             RestTemplate restTemplate = new RestTemplate(getClientHttpRequestFactory());
        HttpHeaders headers = new HttpHeaders();
//        headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
        headers.set("Content-Type", "application/json");
        headers.set("remote-user", "openimis");
           String input = "";
            HttpEntity<String> entity;
        if(!id.isEmpty())
        {
       input = "{\"resourceType\":\"EligibilityRequest\",\"patient\":{\"reference\":\"Patient\\/" + id + "\"}}";
       entity = new HttpEntity<String>(input, headers);
        }
         else
        {
       entity = new HttpEntity<String>( headers);
        }
        String answer = "";
        try {
            ResponseEntity<String> result = restTemplate.exchange(uri, HttpMethod.GET, entity, String.class);
            answer = result.toString();
//            answer = restTemplate.postForObject(uri, entity, String.class);
        } catch (Exception ex) {
            answer = ex.toString();
        }

        System.out.print("Insuree id is " + answer);
        ModelAndView model = new ModelAndView();
        model.setViewName("fhir");
        model.addObject("output_location", answer);
        model.addObject("input_location", input);
        return model;
    }

    public HttpComponentsClientHttpRequestFactory getClientHttpRequestFactory() throws NoSuchAlgorithmException, KeyStoreException, KeyManagementException {
        HttpComponentsClientHttpRequestFactory clientHttpRequestFactory
                = new HttpComponentsClientHttpRequestFactory();
        clientHttpRequestFactory.setHttpClient(httpClient());
        return clientHttpRequestFactory;
    }

    public HttpClient httpClient() throws NoSuchAlgorithmException, KeyStoreException, KeyManagementException {
        CredentialsProvider credentialsProvider = new BasicCredentialsProvider();
        credentialsProvider.setCredentials(AuthScope.ANY,
                new UsernamePasswordCredentials(Constants.username, Constants.password));

        TrustStrategy acceptingTrustStrategy = (X509Certificate[] chain, String authType) -> true;

        SSLContext sslContext = org.apache.http.ssl.SSLContexts.custom()
                .loadTrustMaterial(null, acceptingTrustStrategy)
                .build();

        SSLConnectionSocketFactory csf = new SSLConnectionSocketFactory(sslContext);

        HttpClient client = HttpClientBuilder
                .create()
                .setSSLSocketFactory(csf)
                .setSSLHostnameVerifier(NoopHostnameVerifier.INSTANCE)
                .setDefaultCredentialsProvider(credentialsProvider)
                .build();
        return client;
    }

}
