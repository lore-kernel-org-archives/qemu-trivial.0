Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbKeH-0008U3-SP
	for mharc-qemu-trivial@gnu.org; Fri, 15 Oct 2021 06:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mbKeG-0008R9-LV
 for qemu-trivial@nongnu.org; Fri, 15 Oct 2021 06:41:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mbKeE-0002HW-NN
 for qemu-trivial@nongnu.org; Fri, 15 Oct 2021 06:41:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634294469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u0W+EOMkYtry7P1TCC1yRPM2HSrWyr16cfE57JqjPbk=;
 b=d2rRujwUDBdTFeF0QHwGnvWxifZc2IVlTOcw+ffjMkfHQMIqQhVgduxdmrqnn25O4Lj0Cf
 CvSHx05dUmCS3JAzi6qGmOLoWGPXTrXo/7TPylJTHrsj5zYpz5lo94pxFlboy+LU4JLp4O
 354pDnMzpU+sQZcfmmhTTnQk+xv5HKw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-hjFQnCkfMQugD_R2dzKWNw-1; Fri, 15 Oct 2021 06:41:08 -0400
X-MC-Unique: hjFQnCkfMQugD_R2dzKWNw-1
Received: by mail-ed1-f71.google.com with SMTP id
 c30-20020a50f61e000000b003daf3955d5aso7861047edn.4
 for <qemu-trivial@nongnu.org>; Fri, 15 Oct 2021 03:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=u0W+EOMkYtry7P1TCC1yRPM2HSrWyr16cfE57JqjPbk=;
 b=DhkeAeXXCKK4gpdek+7SHT+Teu8nu6cZ1d/h7W3CFNMfaDtN/02srWSdqzWtNnkIsE
 WW4Z03X1nYM7YaGwhjfGjaCzJlmGaJuRnudVWOFyLzc4gz3ztvQ/fnkM7qhO1/MqyXGL
 yJ8VjF1Vq9Y8bcj0esl3YSU+NUP2wUBf4+hslugBBuk5wuSbJm8AP/7CPWQo7UE7Dr28
 IUIxzXOXOSlfXke3HfS2vXMIaCBjhoalEqzjJW0uJ/dXnoT+0nRi+7Oo25b2OYcpkTue
 YrWTlhAu3DcTe8+FK5WXvfzuOzyexrG06N73q5oe0XmQPiC7gMZgbwQEsuHbIkEWtiVp
 Gv9A==
X-Gm-Message-State: AOAM5325T9Mk1UsC9tXV3jtx5ijITidDuVzstJJm+GG2cfBQ85gu2dwS
 hQVVKDip+jF+9+Z4BCSsgUwy+xmIVTyZM6yktzPsc1J6nIa15TLDyAKcRAb1aeKaWO6J+JyQ/cC
 QmPhYIyjACr6CYCHqlA==
X-Received: by 2002:a17:907:7d8b:: with SMTP id
 oz11mr5607971ejc.476.1634294467295; 
 Fri, 15 Oct 2021 03:41:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwCDFjEI9Q/f0a/oGy8BM4bawSX0e8YK5o28OlSVyrQ6Vooj0BBkqmkWMowhfFbMmd66rHmQ==
X-Received: by 2002:a17:907:7d8b:: with SMTP id
 oz11mr5607933ejc.476.1634294466990; 
 Fri, 15 Oct 2021 03:41:06 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id la1sm3933555ejc.48.2021.10.15.03.41.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 03:41:06 -0700 (PDT)
Message-ID: <15f66b75-05ba-5828-b62f-130219e9ed41@redhat.com>
Date: Fri, 15 Oct 2021 12:41:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 1/1] util: Make some iova_tree parameters const
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20211013182713.888753-1-eperezma@redhat.com>
 <20211013182713.888753-2-eperezma@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211013182713.888753-2-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 15 Oct 2021 10:41:13 -0000

On 13/10/21 20:27, Eugenio Pérez wrote:
> As qemu guidelines:
> Unless a pointer is used to modify the pointed-to storage, give it the
> "const" attribute.
> 
> In the particular case of iova_tree_find it allows to enforce what is
> requested by its comment, since the compiler would shout in case of
> modifying or freeing the const-qualified returned pointer.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> Acked-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   include/qemu/iova-tree.h |  8 ++++----
>   hw/i386/intel_iommu.c    |  2 +-
>   util/iova-tree.c         | 12 ++++++------
>   3 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/include/qemu/iova-tree.h b/include/qemu/iova-tree.h
> index b66cf93c4b..8249edd764 100644
> --- a/include/qemu/iova-tree.h
> +++ b/include/qemu/iova-tree.h
> @@ -59,7 +59,7 @@ IOVATree *iova_tree_new(void);
>    *
>    * Return: 0 if succeeded, or <0 if error.
>    */
> -int iova_tree_insert(IOVATree *tree, DMAMap *map);
> +int iova_tree_insert(IOVATree *tree, const DMAMap *map);
>   
>   /**
>    * iova_tree_remove:
> @@ -74,7 +74,7 @@ int iova_tree_insert(IOVATree *tree, DMAMap *map);
>    *
>    * Return: 0 if succeeded, or <0 if error.
>    */
> -int iova_tree_remove(IOVATree *tree, DMAMap *map);
> +int iova_tree_remove(IOVATree *tree, const DMAMap *map);
>   
>   /**
>    * iova_tree_find:
> @@ -92,7 +92,7 @@ int iova_tree_remove(IOVATree *tree, DMAMap *map);
>    * user is responsible to make sure the pointer is valid (say, no
>    * concurrent deletion in progress).
>    */
> -DMAMap *iova_tree_find(IOVATree *tree, DMAMap *map);
> +const DMAMap *iova_tree_find(const IOVATree *tree, const DMAMap *map);
>   
>   /**
>    * iova_tree_find_address:
> @@ -105,7 +105,7 @@ DMAMap *iova_tree_find(IOVATree *tree, DMAMap *map);
>    *
>    * Return: same as iova_tree_find().
>    */
> -DMAMap *iova_tree_find_address(IOVATree *tree, hwaddr iova);
> +const DMAMap *iova_tree_find_address(const IOVATree *tree, hwaddr iova);
>   
>   /**
>    * iova_tree_foreach:
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 75f075547f..33a8af9191 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -1105,7 +1105,7 @@ static int vtd_page_walk_one(IOMMUTLBEvent *event, vtd_page_walk_info *info)
>           .translated_addr = entry->translated_addr,
>           .perm = entry->perm,
>       };
> -    DMAMap *mapped = iova_tree_find(as->iova_tree, &target);
> +    const DMAMap *mapped = iova_tree_find(as->iova_tree, &target);
>   
>       if (event->type == IOMMU_NOTIFIER_UNMAP && !info->notify_unmap) {
>           trace_vtd_page_walk_one_skip_unmap(entry->iova, entry->addr_mask);
> diff --git a/util/iova-tree.c b/util/iova-tree.c
> index 7990692cbd..23ea35b7a4 100644
> --- a/util/iova-tree.c
> +++ b/util/iova-tree.c
> @@ -42,14 +42,14 @@ IOVATree *iova_tree_new(void)
>       return iova_tree;
>   }
>   
> -DMAMap *iova_tree_find(IOVATree *tree, DMAMap *map)
> +const DMAMap *iova_tree_find(const IOVATree *tree, const DMAMap *map)
>   {
>       return g_tree_lookup(tree->tree, map);
>   }
>   
> -DMAMap *iova_tree_find_address(IOVATree *tree, hwaddr iova)
> +const DMAMap *iova_tree_find_address(const IOVATree *tree, hwaddr iova)
>   {
> -    DMAMap map = { .iova = iova, .size = 0 };
> +    const DMAMap map = { .iova = iova, .size = 0 };
>   
>       return iova_tree_find(tree, &map);
>   }
> @@ -60,7 +60,7 @@ static inline void iova_tree_insert_internal(GTree *gtree, DMAMap *range)
>       g_tree_insert(gtree, range, range);
>   }
>   
> -int iova_tree_insert(IOVATree *tree, DMAMap *map)
> +int iova_tree_insert(IOVATree *tree, const DMAMap *map)
>   {
>       DMAMap *new;
>   
> @@ -96,9 +96,9 @@ void iova_tree_foreach(IOVATree *tree, iova_tree_iterator iterator)
>       g_tree_foreach(tree->tree, iova_tree_traverse, iterator);
>   }
>   
> -int iova_tree_remove(IOVATree *tree, DMAMap *map)
> +int iova_tree_remove(IOVATree *tree, const DMAMap *map)
>   {
> -    DMAMap *overlap;
> +    const DMAMap *overlap;
>   
>       while ((overlap = iova_tree_find(tree, map))) {
>           g_tree_remove(tree->tree, overlap);
> 

Queued, thanks.

Paolo


