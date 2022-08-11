Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oM7g6-0001XL-IM
	for mharc-qemu-trivial@gnu.org; Thu, 11 Aug 2022 08:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oM7g4-0001Qi-Vx
 for qemu-trivial@nongnu.org; Thu, 11 Aug 2022 08:52:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oM7g1-0007Ym-Ky
 for qemu-trivial@nongnu.org; Thu, 11 Aug 2022 08:52:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660222361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ccHKV60GUy43jU9rl4e6LjFMRT/GAai6MdkD4oo/FDM=;
 b=F/KM5Nil5Awe5ScWXT2acy2v0C4D8Q9RvaDLp+Jm1dug4UVL4wkc33XvIMVG8Tv4xMX31F
 ikAbBF7vTUY0/BO1BCM2RI+4QxY3NnaUaP8lZBDHchgZn9SgTaywtdrRAfOB0U/fDCnE7f
 afeJy6eF09KGX3pg2PuN3nRqCriCUm0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-553-KcrGri9_M865k26Q8euqUQ-1; Thu, 11 Aug 2022 08:52:37 -0400
X-MC-Unique: KcrGri9_M865k26Q8euqUQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 f21-20020a1cc915000000b003a3551598a1so1629193wmb.0
 for <qemu-trivial@nongnu.org>; Thu, 11 Aug 2022 05:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=ccHKV60GUy43jU9rl4e6LjFMRT/GAai6MdkD4oo/FDM=;
 b=VXRHTUDFXkst/hqffN9nt7L7QQS/YIpmlRGaf3fQ6m2jUadxYPWK71EWOv+ab/KH8+
 zKxJSMqgLhRCKi5FD4gu9M/GzxWWChWDDd+aRl9RAZHFiFf5yS/jBcjjUoFKTZBOvLja
 SjjmK+ZDv2bYi+MvSnsONISmXDQbK6AVoFK5Hze5Ll27r5bPaCjAJ/jYoD94cgyVx1td
 BdZJZI28nwBbv7ThyTzNNdkb8wRiV8wmZLeTAb1svMm7uoHtOpAa5krMufggzP9kF0zi
 h1Vt53XG9mCR7B+8yWAamYuqhp5zR3q4U9DbAW/VVHWkEhFbjqD8r0O6PVRpHHJRegwx
 eC5w==
X-Gm-Message-State: ACgBeo2XgWP+JJZOaC8gDlVaiZ33yCw2IIgWDxjn6D+IKjaa9QpQjCbG
 J38ebe1QUTLxzCKubvWocJDzGV5kae5eX9S/iAjjlAeDzcTiO5133K0Ynfgz0PMYdrWkpWm61h4
 jEa5x+T4OcJTLz5yRtA==
X-Received: by 2002:a5d:64e5:0:b0:220:7859:7bc with SMTP id
 g5-20020a5d64e5000000b00220785907bcmr18788674wri.669.1660222356752; 
 Thu, 11 Aug 2022 05:52:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7gaBV7mIJu9yk69aGmTrdJwTF3MhfFPuzS82xXMiFSbDWF4gQ0mkJVJpcyVdG52+GOF/WjpA==
X-Received: by 2002:a5d:64e5:0:b0:220:7859:7bc with SMTP id
 g5-20020a5d64e5000000b00220785907bcmr18788661wri.669.1660222356534; 
 Thu, 11 Aug 2022 05:52:36 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-42-115-19.web.vodafone.de.
 [109.42.115.19]) by smtp.gmail.com with ESMTPSA id
 p10-20020a05600c064a00b003a54f49c1c8sm5978048wmm.12.2022.08.11.05.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 05:52:36 -0700 (PDT)
Message-ID: <55aa1d93-f026-9a47-8502-96f648a37e4b@redhat.com>
Date: Thu, 11 Aug 2022 14:52:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] tests/qtest: misc tweaks to readconfig
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20220809093854.168438-1-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220809093854.168438-1-berrange@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Aug 2022 12:52:45 -0000

On 09/08/2022 11.38, Daniel P. Berrangé wrote:
> The property name parameter is ignored when visiting a top
> level type, but the obvious typo should be fixed to avoid
> confusion. A few indentation issues were tidied up. We
> can break out of the loop when finding the RNG device.
> Finally, close the temp FD immediately when no longer
> needed.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qtest/readconfig-test.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/readconfig-test.c b/tests/qtest/readconfig-test.c
> index 2e604d7c2d..c7a9b0c7dd 100644
> --- a/tests/qtest/readconfig-test.c
> +++ b/tests/qtest/readconfig-test.c
> @@ -33,13 +33,12 @@ static QTestState *qtest_init_with_config(const char *cfgdata)
>       g_assert_cmpint(cfgfd, >=, 0);
>   
>       ret = qemu_write_full(cfgfd, cfgdata, strlen(cfgdata));
> +    close(cfgfd);
>       if (ret < 0) {
>           unlink(cfgpath);
>       }
>       g_assert_cmpint(ret, ==, strlen(cfgdata));
>   
> -    close(cfgfd);
> -
>       args = g_strdup_printf("-nodefaults -machine none -readconfig %s", cfgpath);
>   
>       qts = qtest_init(args);
> @@ -79,7 +78,7 @@ static void test_x86_memdev(void)
>           "size = \"200\"";
>   
>       qts = qtest_init_with_config(cfgdata);
> -   /* Test valid command */
> +    /* Test valid command */
>       resp = qtest_qmp(qts, "{ 'execute': 'query-memdev' }");
>       test_x86_memdev_resp(qdict_get(resp, "return"));
>       qobject_unref(resp);
> @@ -96,7 +95,7 @@ static void test_spice_resp(QObject *res)
>   
>       g_assert(res);
>       v = qobject_input_visitor_new(res);
> -    visit_type_SpiceInfo(v, "spcie", &spice, &error_abort);
> +    visit_type_SpiceInfo(v, "spice", &spice, &error_abort);
>   
>       g_assert(spice);
>       g_assert(spice->enabled);
> @@ -114,7 +113,7 @@ static void test_spice(void)
>           "unix = \"on\"\n";
>   
>       qts = qtest_init_with_config(cfgdata);
> -   /* Test valid command */
> +    /* Test valid command */
>       resp = qtest_qmp(qts, "{ 'execute': 'query-spice' }");
>       test_spice_resp(qdict_get(resp, "return"));
>       qobject_unref(resp);
> @@ -144,6 +143,7 @@ static void test_object_rng_resp(QObject *res)
>           if (g_str_equal(obj->name, "rng0") &&
>               g_str_equal(obj->type, "child<rng-builtin>")) {
>               seen_rng = true;
> +            break;
>           }
>   
>           tmp = tmp->next;
> @@ -164,7 +164,7 @@ static void test_object_rng(void)
>           "id = \"rng0\"\n";
>   
>       qts = qtest_init_with_config(cfgdata);
> -   /* Test valid command */
> +    /* Test valid command */
>       resp = qtest_qmp(qts,
>                        "{ 'execute': 'qom-list',"
>                        "  'arguments': {'path': '/objects' }}");

Reviewed-by: Thomas Huth <thuth@redhat.com>


