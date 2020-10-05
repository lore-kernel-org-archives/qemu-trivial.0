Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kPM93-00086U-NF
	for mharc-qemu-trivial@gnu.org; Mon, 05 Oct 2020 04:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kPM8u-00085n-1G
 for qemu-trivial@nongnu.org; Mon, 05 Oct 2020 04:46:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kPM8m-00025v-RN
 for qemu-trivial@nongnu.org; Mon, 05 Oct 2020 04:46:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601887599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iGtB50YnsRxdtPcnxSKy9zziUsWLU+C2ClHiTUgK4HY=;
 b=ErKtggPNLAdxJRoMZM8qJ3tJKJHTvZWYTsN4iCtjzFaODiVfWiC16EcDUaMkNAT/qGsPPz
 MqouicTSxQBDFccK45irfQlqZ77GzLqO9HRq2oMajYgKWiaJq+doNFTBhWXpe5wEN8C36Z
 p3SEM/zYSZ22/sDVPFF+qgYmTr4iThA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-0S8aBv6hOE6mU2yYMaBrBw-1; Mon, 05 Oct 2020 04:46:38 -0400
X-MC-Unique: 0S8aBv6hOE6mU2yYMaBrBw-1
Received: by mail-wm1-f70.google.com with SMTP id 13so2183570wmf.0
 for <qemu-trivial@nongnu.org>; Mon, 05 Oct 2020 01:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iGtB50YnsRxdtPcnxSKy9zziUsWLU+C2ClHiTUgK4HY=;
 b=hyS8tK5D//i5d4EwkBCulPKQMi39n0OnAXOzTZZaI1MgcwHV/8DEdWD1J0OwiasUr3
 nr3WnX1KyjH+txRhsJ+/trkn8oWn/Q5xrd3m3TpYU8QpOvzhIqy3W78u3j4toFCVK9Bn
 zwP8iGX6FRa1Pk2d7KHmlPFwQD0/waVb92EJW9K8KSCf/WXhu+M//+fkNh7u42vUq9fZ
 QEB5DngnF2XbBiHvri5lshu1XAM4AKPFOsN7vgi7rivIJcU3puI+Uj7SbcVknorfS4LO
 tRbrFDlho615XzTG31I9SCPlcaxQy5n95E7NdOEC9LqGcFfqYaKZlWXZMvm5Av8zvv1Q
 Uivw==
X-Gm-Message-State: AOAM5318g5nKfQxaGdUV4AD5WjMlGKcnFXq343Qvzh4B+TGBE3weGoyh
 DMF39fbtHJXbEhZWln5AySqBs10C8rbyZF8PQ19DqaVoZ/7FBeHPVVpjwHRmb863l8Yg8OYRlxc
 SwrlDitbPftTxb0+luw==
X-Received: by 2002:adf:f508:: with SMTP id q8mr15628311wro.233.1601887596919; 
 Mon, 05 Oct 2020 01:46:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxh8gBdXjFPP6Fg5LpFJWyuWEnPq5OgT89WT+nnJI2qo5KAVzXdVErIty6ISrAJ1Uq7rNJfQ==
X-Received: by 2002:adf:f508:: with SMTP id q8mr15628293wro.233.1601887596747; 
 Mon, 05 Oct 2020 01:46:36 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:2e86:3d8b:8b70:920c?
 ([2001:b07:6468:f312:2e86:3d8b:8b70:920c])
 by smtp.gmail.com with ESMTPSA id f63sm11027412wme.38.2020.10.05.01.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2020 01:46:36 -0700 (PDT)
Subject: Re: [PATCH] qom: Improve error message displayed with missing object
 properties
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20200920155340.401482-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0263e47d-549e-8acb-a6cb-93a7436f5f6d@redhat.com>
Date: Mon, 5 Oct 2020 10:46:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200920155340.401482-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 01:25:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 05 Oct 2020 08:46:51 -0000

On 20/09/20 17:53, Philippe Mathieu-Daudé wrote:
> Instead of only displaying the property missing, also display
> the object name. This help developer to quickly figure out the
> mistake without opening a debugger.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  qom/object.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/qom/object.c b/qom/object.c
> index 387efb25ebe..257914b1fe3 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -1259,7 +1259,8 @@ ObjectProperty *object_property_find(Object *obj, const char *name,
>          return prop;
>      }
>  
> -    error_setg(errp, "Property '.%s' not found", name);
> +    error_setg(errp, "Property '%s.%s' not found",
> +               object_get_typename(obj), name);
>      return NULL;
>  }
>  
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

I think it's okay for qemu-trivial.


