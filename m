Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kO0Hd-0005q5-Q4
	for mharc-qemu-trivial@gnu.org; Thu, 01 Oct 2020 11:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kO0Hc-0005ms-HD
 for qemu-trivial@nongnu.org; Thu, 01 Oct 2020 11:14:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kO0Ha-0007gh-II
 for qemu-trivial@nongnu.org; Thu, 01 Oct 2020 11:14:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601565248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ErXrq1Qxd/KCQTO9mhhx/WLKLdDbsSAU1USGV/RH6jM=;
 b=C2Z4yrW1wYBb7YNA2CuayJbq58B3Snsi/DzcA89NQnEKK5+xAE12wTzyheePGsVb/aqYVD
 c/NCLkCkr+re2G97ssKGX/FFWdX1+PFUXth4e8VFXpI5Pbb85PYuWJRClL8eJkEtMdHYk8
 xyRdacGq/unbzHoH6sxA+7uU/1hJNBk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-JbbAPmGpNZmTYnYjoyuGvQ-1; Thu, 01 Oct 2020 11:14:07 -0400
X-MC-Unique: JbbAPmGpNZmTYnYjoyuGvQ-1
Received: by mail-wr1-f70.google.com with SMTP id a2so2172529wrp.8
 for <qemu-trivial@nongnu.org>; Thu, 01 Oct 2020 08:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ErXrq1Qxd/KCQTO9mhhx/WLKLdDbsSAU1USGV/RH6jM=;
 b=toevtHj5T23hKZgMSgX86zaQ1kaIPFMsgBwxd3p+eBrL0axmKCwifT+0gkzP2HsgrT
 IKRFSmMRN7osSUuA7IpbduktqbjoHIDa2EVCdVaTjZyeKNyDmhb8Jpmop4fB+sG2e5NV
 1/pUyG3x92JIMeCDbla22Hfh9qejt7rxJyl875tno+2EhytzsPjzvtDExRxyPoPW682a
 MnZcZy01lEZU5rDXIqjJ4Vl2fKwHRFzHvnzk1eTtBZFgYLlHWlcpYLm7e10erPFCc/yt
 PWHUEEBX9HxrgTr87XnMuu5y7vWhpGbmVxVhslRs2JWt0CDH+FsGTqNm+OiRWknafZ/b
 OvTg==
X-Gm-Message-State: AOAM531FdXBIdCwiZqx1aWeXwUca1VcqDAdXZW+Nxx+KuYDQvjo7YZXh
 svIeWXQHw/8JsgmVYCdqFWioNhpOKzJzKY2knMo9pGDFNMAaV41//M/SGKjaX0KNSF64MMSCw3N
 7Ap69fibTFs820mH7pQ==
X-Received: by 2002:a5d:4c88:: with SMTP id z8mr9470372wrs.218.1601565245856; 
 Thu, 01 Oct 2020 08:14:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzleR/4PnbFPelvjE0zQQidtmG+WB/O7Zi5qDZhjtXNK6gAcv3Zv2jqDfjQakG8XC5zwJE9bw==
X-Received: by 2002:a5d:4c88:: with SMTP id z8mr9470339wrs.218.1601565245571; 
 Thu, 01 Oct 2020 08:14:05 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:86de:492a:fae3:16f2?
 ([2001:b07:6468:f312:86de:492a:fae3:16f2])
 by smtp.gmail.com with ESMTPSA id t202sm443873wmt.14.2020.10.01.08.14.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2020 08:14:04 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] target/i386/cpu: Restrict some of feature-words
 uses to system-mode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <rth@twiddle.net>, Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Eric Blake <eblake@redhat.com>
References: <20201001144152.1555659-1-philmd@redhat.com>
 <20201001144152.1555659-3-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <933089b7-a088-d142-bf0c-55cae3e9bd70@redhat.com>
Date: Thu, 1 Oct 2020 17:14:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201001144152.1555659-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 04:25:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.26, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Oct 2020 15:14:12 -0000

On 01/10/20 16:41, Philippe Mathieu-Daudé wrote:
> The feature-words properties are not used in user-mode emulation,
> restrict it to system-mode.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

This seems a bit pointless honestly.  It's going to be a few KBs of code
at most.  I would end the work with the patches that have already been
queued.

Paolo

> ---
>  target/i386/cpu.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 2eec53ca22..9f72342506 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -4607,6 +4607,7 @@ static void x86_cpuid_set_tsc_freq(Object *obj, Visitor *v, const char *name,
>      cpu->env.tsc_khz = cpu->env.user_tsc_khz = value / 1000;
>  }
>  
> +#if !defined(CONFIG_USER_ONLY)
>  /* Generic getter for "feature-words" and "filtered-features" properties */
>  static void x86_cpu_get_feature_words(Object *obj, Visitor *v,
>                                        const char *name, void *opaque,
> @@ -4666,6 +4667,7 @@ static const char *x86_cpu_feature_name(FeatureWord w, int bitnr)
>      assert(bitnr < 32 || !(name && feature_word_info[w].type == CPUID_FEATURE_WORD));
>      return name;
>  }
> +#endif /* CONFIG_USER_ONLY */
>  
>  /*
>   * Convert all '_' in a feature string option name to '-', to make feature
> @@ -4783,6 +4785,7 @@ static void x86_cpu_parse_featurestr(const char *typename, char *features,
>  static void x86_cpu_expand_features(X86CPU *cpu, Error **errp);
>  static void x86_cpu_filter_features(X86CPU *cpu, bool verbose);
>  
> +#if !defined(CONFIG_USER_ONLY)
>  /* Build a list with the name of all features on a feature word array */
>  static void x86_cpu_list_feature_names(FeatureWordArray features,
>                                         strList **feat_names)
> @@ -4853,6 +4856,7 @@ static void x86_cpu_class_check_missing_features(X86CPUClass *xcc,
>  
>      object_unref(OBJECT(xc));
>  }
> +#endif /* CONFIG_USER_ONLY */
>  
>  /* Print all cpuid feature names in featureset
>   */
> @@ -4987,7 +4991,9 @@ static void x86_cpu_definition_entry(gpointer data, gpointer user_data)
>  
>      info = g_malloc0(sizeof(*info));
>      info->name = x86_cpu_class_get_model_name(cc);
> +#if !defined(CONFIG_USER_ONLY)
>      x86_cpu_class_check_missing_features(cc, &info->unavailable_features);
> +#endif
>      info->has_unavailable_features = true;
>      info->q_typename = g_strdup(object_class_get_name(oc));
>      info->migration_safe = cc->migration_safe;
> @@ -6941,6 +6947,7 @@ static void x86_cpu_initfn(Object *obj)
>      object_property_add(obj, "tsc-frequency", "int",
>                          x86_cpuid_get_tsc_freq,
>                          x86_cpuid_set_tsc_freq, NULL, NULL);
> +#if !defined(CONFIG_USER_ONLY)
>      object_property_add(obj, "feature-words", "X86CPUFeatureWordInfo",
>                          x86_cpu_get_feature_words,
>                          NULL, NULL, (void *)env->features);
> @@ -6957,7 +6964,6 @@ static void x86_cpu_initfn(Object *obj)
>                          x86_cpu_get_unavailable_features,
>                          NULL, NULL, NULL);
>  
> -#if !defined(CONFIG_USER_ONLY)
>      object_property_add(obj, "crash-information", "GuestPanicInformation",
>                          x86_cpu_get_crash_info_qom, NULL, NULL, NULL);
>  #endif
> 


