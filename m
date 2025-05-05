Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBpwK-0007s4-67
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2025 03:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uBpwH-0007qk-Pp
 for qemu-trivial@nongnu.org; Mon, 05 May 2025 03:08:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uBpwE-0001cI-P4
 for qemu-trivial@nongnu.org; Mon, 05 May 2025 03:08:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746428909;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VGUxwV8y8RRbGT/iyxVZZGeQk9RpPey1+C+CJYCet10=;
 b=i2an5SO1hyhDmZIshUJ8EpPyAzPhjMbzdaJYPAutfIgxFvMufoBsAbN1QUMMup5NmcrjCX
 6Etp+eC/dcrLDzF0va8g8auZ0EyZebM5tuN9RjErgvhpUo9b7i5ZZgEukKg4O9CXiCrWEY
 rdpVkRTUJ0EX6ppYSg46nrdRDaiqT0E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-0RpCXOwmOwG4iWzDKUusUA-1; Mon, 05 May 2025 03:08:28 -0400
X-MC-Unique: 0RpCXOwmOwG4iWzDKUusUA-1
X-Mimecast-MFC-AGG-ID: 0RpCXOwmOwG4iWzDKUusUA_1746428907
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-39c30f26e31so2359030f8f.3
 for <qemu-trivial@nongnu.org>; Mon, 05 May 2025 00:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746428907; x=1747033707;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VGUxwV8y8RRbGT/iyxVZZGeQk9RpPey1+C+CJYCet10=;
 b=uqRBQ7UmAHV4rywb6xReGp1Hi2eoBAeDAM2JrV/0CqMsLtNcO+N1QJhteCvIkjUT6I
 KLUlo8tIlr+1ACxwBUYVcWq4tPo+Ia//6lildfFxad3Xr42UqapuNMEU+BV/NwV2Q06/
 ISEflzPEROOzQcrPBNgjWLHwVAiKrk6ou6/CgdPN/HEWqX+kS5GWV+bZtV1hMcLTdp1i
 yaLalTIg6mhk5oG6zIU/Z33DZA0Yri5ZTWgtCoHI6LjMvjFX8sTtOL7JsuRMongSRWz4
 HqeWZf3H3lSG+kP4T/tgFZD1WbvuEAwFgw0x7l598/bXBBh6O6zzF/abGzsiwMEZCuws
 M7nA==
X-Gm-Message-State: AOJu0YzdK8dryGpR+8H6+sVMu7virvgFLjL9q3/ueCUus9uuGuTufrZh
 /dpD7skDnZbhb3YSdTgAb2Bzp/IFCRblKk9/0rwNonrSDYBBSpJhgLDMN1lycySAZFtDfbOVBPg
 xvmiYtKqzN6YLoZnHXAN6wGbnWrP48uG6W75p8CIPuruQ88/GM5HxaHU=
X-Gm-Gg: ASbGncvtglrOS6snxwSvTPKwV1BnbGr6eN62qxfRpm/biJsvtjmOth01RSoj4QcO/BO
 ePSh6X+L5c1ChBrQSlUX1KoP4LKTAuAy/dFVUks2Neqml9bC9o6vn+0tWmeOZJSxPt38kt4xR0I
 qPJFlaMmlcAXVRmpDbK7epSBoRAE9FeGDvmicqyZnq0M0q3mQqR55IEwKDuY6ee9R2Lzv5kgN70
 yjY04Gpvp/c/36uD3ccgmZqewGNmMnvRJk+rgkWj9NBLc8Vn9JaOiGYKzLzNQMspcUvLdE+z5qV
 4cQH8/MJa86ccWkO/R+BKnxRYvB9pmW7MVjUBbHX6DhNTRpFNR3jg17VbSE=
X-Received: by 2002:a05:6000:40db:b0:39e:f89b:85ce with SMTP id
 ffacd0b85a97d-3a09fd82f5bmr4421105f8f.26.1746428906941; 
 Mon, 05 May 2025 00:08:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1JD/wNGesZh9SgZWIHRqazn3WQLTe3rtPiVRwm5jo1VxGMVfGWz3P1PO/OpnK9u+iIDY8sQ==
X-Received: by 2002:a05:6000:40db:b0:39e:f89b:85ce with SMTP id
 ffacd0b85a97d-3a09fd82f5bmr4421080f8f.26.1746428906594; 
 Mon, 05 May 2025 00:08:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2b20aa6sm170652435e9.27.2025.05.05.00.08.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 00:08:25 -0700 (PDT)
Message-ID: <676f19b8-8187-4b9a-b2f9-9a6fe839ebd1@redhat.com>
Date: Mon, 5 May 2025 09:08:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH] hw/i386/acpi-build: Fix typo in function name
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, philmd@linaro.org, alex.bennee@linaro.org
References: <20250504215639.54860-8-gustavo.romero@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250504215639.54860-8-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _PC9XJcoXCVkAfZRp3MMtdX3HzaeJUfT6Hhz6aYIYzA_1746428907
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 05 May 2025 07:08:34 -0000

Hi Gustavo,

On 5/4/25 11:56 PM, Gustavo Romero wrote:
> Fix missing "i" in the name of the function responsible for adding the call to
> the PCI notification method (PCNT) in the ACPI table.
>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
this is a dup of
https://lore.kernel.org/all/20250428102628.378046-4-eric.auger@redhat.com/
nevertheless
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Eric
> ---
>  hw/i386/acpi-build.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index b5836417a0..f40ad062f9 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -589,8 +589,8 @@ void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
>      }
>  }
>  
> -static bool build_append_notfication_callback(Aml *parent_scope,
> -                                              const PCIBus *bus)
> +static bool build_append_notification_callback(Aml *parent_scope,
> +                                               const PCIBus *bus)
>  {
>      Aml *method;
>      PCIBus *sec;
> @@ -604,7 +604,7 @@ static bool build_append_notfication_callback(Aml *parent_scope,
>              continue;
>          }
>          nr_notifiers = nr_notifiers +
> -                       build_append_notfication_callback(br_scope, sec);
> +                       build_append_notification_callback(br_scope, sec);
>          /*
>           * add new child scope to parent
>           * and keep track of bus that have PCNT,
> @@ -1773,7 +1773,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>          PCIBus *b = PCI_HOST_BRIDGE(pci_host)->bus;
>  
>          scope = aml_scope("\\_SB.PCI0");
> -        has_pcnt = build_append_notfication_callback(scope, b);
> +        has_pcnt = build_append_notification_callback(scope, b);
>          if (has_pcnt) {
>              aml_append(dsdt, scope);
>          }


