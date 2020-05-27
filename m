Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jdy5W-0004I6-7W
	for mharc-qemu-trivial@gnu.org; Wed, 27 May 2020 11:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jdy5U-0004HT-D4
 for qemu-trivial@nongnu.org; Wed, 27 May 2020 11:35:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29713
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jdy5T-000698-Jm
 for qemu-trivial@nongnu.org; Wed, 27 May 2020 11:35:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590593722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z9bSfFjS0Nj2cluGha6pXYmnl6bsGUryxzjLZtvPQsY=;
 b=K2qHqPVxA5TE41BzGyaI6ulBEqtvBh1DEOc0sb+y6bZCgiW7728uzNvNNQ09Wp0I6Efrug
 JDZndSan8L5syDsH+7MdPgxXCa7g4d0eSXI+kqyT8h1B3IMKStsQpPjaKgO+D7ZGLX0fYt
 R9fSmbOHKIKWqJPDEuUnxKtTQSdySIk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-lZhJDVkYO5Gzezf3q2fkxQ-1; Wed, 27 May 2020 11:35:18 -0400
X-MC-Unique: lZhJDVkYO5Gzezf3q2fkxQ-1
Received: by mail-ed1-f70.google.com with SMTP id dh6so2426189edb.1
 for <qemu-trivial@nongnu.org>; Wed, 27 May 2020 08:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z9bSfFjS0Nj2cluGha6pXYmnl6bsGUryxzjLZtvPQsY=;
 b=F/7M7vXdxaWcjC3sJS/5u7eeuGhLf5D818feSEQ+5YRmcU+vYVYTJb2SjJymIPpj+Z
 OwMVF4lIDiULM+Hr8KBS7mmyUOcWVhCn1WehMos4SlHH0l1RgKwf0/f3fcnbDzLw6vYL
 PtUX/9Q9Xztr9YEPq0J1hML8z41soqa189iaiNlciF3Dsc4lxhKHaO8wgxD0Ns6rRSvy
 X1UwbU6L9Rabc8dOGNEBzAnB18xN23ERJc9msXC6tpb6ChcXzj3dclWF9HhSNoUQKigC
 9yndcU5uYBTunTUA6uT+TyQUbU9ba5eCuqIBv08gKZd4Jesy023G1ukKdble2a1Ns8Wi
 2TTg==
X-Gm-Message-State: AOAM533bGev7dk/cIsadZj4tr0UXONh52FdRR0QkVPhPmocSgUeeDiPQ
 nLux4F0LvPs4lxRDiTK+BkSFoPY3HyZjn6AIZ1fJy1gmVZ9+nuHeFbUFYtbNgeitBIbVZtexI+R
 LR1MtXPZ+QEc1Nzafow==
X-Received: by 2002:a17:906:13ca:: with SMTP id
 g10mr6603611ejc.433.1590593717409; 
 Wed, 27 May 2020 08:35:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxw2CTdnfZ3TsiTNtarlNs2KreCjUkPLU+/AiFWblSE+mOkaWC2wlKoExcP9Bp9sHxkOfvJjQ==
X-Received: by 2002:a17:906:13ca:: with SMTP id
 g10mr6603588ejc.433.1590593717115; 
 Wed, 27 May 2020 08:35:17 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:3c1c:ffba:c624:29b8?
 ([2001:b07:6468:f312:3c1c:ffba:c624:29b8])
 by smtp.gmail.com with ESMTPSA id s8sm2447405edj.64.2020.05.27.08.35.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 May 2020 08:35:16 -0700 (PDT)
Subject: Re: [PATCH] hw/pci: Fix crash when running QEMU with "-nic
 model=rocker"
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
References: <20200527153152.9211-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <85cf7423-47e8-898a-c1da-e527adcaaa6b@redhat.com>
Date: Wed, 27 May 2020 17:35:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200527153152.9211-1-thuth@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/27 01:25:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 27 May 2020 15:35:25 -0000

On 27/05/20 17:31, Thomas Huth wrote:
> QEMU currently aborts when being started with "-nic model=rocker" or with
> "-net nic,model=rocker". This happens because the "rocker" device is not
> a normal NIC but a switch, which has different properties. Thus we should
> only consider real NIC devices for "-nic" and "-net". These devices can
> be identified by the "netdev" property, so check for this property before
> adding the device to the list.
> 
> Reported-by: Michael Tokarev <mjt@tls.msk.ru>
> Fixes: 52310c3fa7dc854d ("net: allow using any PCI NICs in -net or -nic")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/pci/pci.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 70c66965f5..46214f8287 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1887,7 +1887,18 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
>          if (test_bit(DEVICE_CATEGORY_NETWORK, dc->categories) &&
>              dc->user_creatable) {
>              const char *name = object_class_get_name(list->data);
> -            g_ptr_array_add(pci_nic_models, (gpointer)name);
> +            /*
> +             * A network device might also be something else than a NIC, see
> +             * e.g. the "rocker" device. Thus we have to look for the "netdev"
> +             * property, too. Unfortunately, some devices like virtio-net only
> +             * create this property during instance_init, so we have to create
> +             * a temporary instance here to be able to check it.
> +             */
> +            Object *obj = object_new_with_class(OBJECT_CLASS(dc));
> +            if (object_property_find(obj, "netdev", NULL)) {
> +                g_ptr_array_add(pci_nic_models, (gpointer)name);
> +            }
> +            object_unref(obj);
>          }
>          next = list->next;
>          g_slist_free_1(list);
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


