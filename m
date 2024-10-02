Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1svwdd-0003Ay-9G
	for mharc-qemu-trivial@gnu.org; Wed, 02 Oct 2024 06:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1svwdc-00037k-Aq
 for qemu-trivial@nongnu.org; Wed, 02 Oct 2024 06:31:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1svwda-0001BM-Ro
 for qemu-trivial@nongnu.org; Wed, 02 Oct 2024 06:31:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727865078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=A1snHZpx6IsgSoZdp95wgfQFZ0AETdZ3wDPAQ8TryMY=;
 b=QwTW2hicEu92HUbwaWaCWOjli8t8YfOPob/xJIsgG2UIeKJczlEhviroJFLoKytH15bPOJ
 YQQI3CZQLYflQQvC84OWyyh2tQytYauruiaPehgFQT7AksMZRnqnbhnBmdjMr3WoGHlUjs
 O9OkH/ZHOVqvtoXGLj8N+vYBL0+jovs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-psrmjqI-NWS1MFo_qWWTNg-1; Wed, 02 Oct 2024 06:31:17 -0400
X-MC-Unique: psrmjqI-NWS1MFo_qWWTNg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42cb33e6299so50018265e9.2
 for <qemu-trivial@nongnu.org>; Wed, 02 Oct 2024 03:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727865076; x=1728469876;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A1snHZpx6IsgSoZdp95wgfQFZ0AETdZ3wDPAQ8TryMY=;
 b=Z7TgBe+LBzqiDp/48I79M9E0bz0wddvpe7l/ISpOlFF8fzwAGoZ7ocZLvmkVjIZ91O
 M87z3HSeRsugHYaAcI6AiWBbYRDTsoyCRVWMwWlNZz3uVGOaNN6b8rDckbeSrylo8Hmq
 oydQRm8j1kB0mc9tj0VSis2KMjI5K65byjk4/LFSQpCkrpZMwWrM2tHSMI/PiQsGNrVN
 fk5inPUCgOc4hm6fZQHqqTQaMGatygxXlFWnNrDxMQvMlavaom/ey1yee2crCH9ZKWHt
 bnaMBquRuROmaxpvZZeZCqDrcJ1BL3wRmq83+RBsHQKSJqHdlNbqlF7LLZz9so7DncmQ
 1h1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUegr73l3gw6CrkY2e+t3+FpOg/N5HJAoHEzgK2pXQ8TzaiB2b3ZWygescLzsL1FpylERBxT5tKxQhTHkI=@nongnu.org
X-Gm-Message-State: AOJu0YxFLJCPIKQVe2iK/CFBKyMDueXywghACA64fJpGmjgk7edG7PBa
 R9Vm7qijGB3C/ju42Ihk25a0dQfdcYDTc25/oO0e4zze3ct5vivrzLZ4CpX/Do/JqqhCBxrlyag
 JTUxPlYvhkLBLyK9z9qqtkQzKsnHEy5w+80DdhxmANsJBSOvtyJWpiDk=
X-Received: by 2002:a05:600c:3108:b0:42c:ae30:fc4d with SMTP id
 5b1f17b1804b1-42f777b64c9mr19409735e9.7.1727865075682; 
 Wed, 02 Oct 2024 03:31:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFklLSlrnAqc897+yoyJzMSaYvXDf1fk/tlM2FgZnlyfsS8H+q4/pzdtLpqO4NHfQTfqNOJFw==
X-Received: by 2002:a05:600c:3108:b0:42c:ae30:fc4d with SMTP id
 5b1f17b1804b1-42f777b64c9mr19409585e9.7.1727865075314; 
 Wed, 02 Oct 2024 03:31:15 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-49-143.web.vodafone.de.
 [109.42.49.143]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cd56e6596sm13671419f8f.63.2024.10.02.03.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2024 03:31:14 -0700 (PDT)
Message-ID: <c9f57f07-b3ff-4724-94f0-3760c2bb0a50@redhat.com>
Date: Wed, 2 Oct 2024 12:31:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] util/iova-tree: Remove deadcode
To: dave@treblig.org, peterx@redhat.com, QEMU Trivial <qemu-trivial@nongnu.org>
Cc: qemu-devel@nongnu.org
References: <20240918142515.153074-1-dave@treblig.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240918142515.153074-1-dave@treblig.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 02 Oct 2024 10:31:20 -0000

On 18/09/2024 16.25, dave@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <dave@treblig.org>
> 
> iova_tree_find_address, and iova_tree_foreach have never been
> used since the code was originally added by:
>    eecf5eedbd ("util: implement simple iova tree")
> 
> Remove them.
> 
> Signed-off-by: Dr. David Alan Gilbert <dave@treblig.org>
> ---
>   include/qemu/iova-tree.h | 25 -------------------------
>   util/iova-tree.c         | 23 -----------------------
>   2 files changed, 48 deletions(-)
> 
> diff --git a/include/qemu/iova-tree.h b/include/qemu/iova-tree.h
> index 2a10a7052e..44a45931d5 100644
> --- a/include/qemu/iova-tree.h
> +++ b/include/qemu/iova-tree.h
> @@ -111,31 +111,6 @@ const DMAMap *iova_tree_find(const IOVATree *tree, const DMAMap *map);
>    */
>   const DMAMap *iova_tree_find_iova(const IOVATree *tree, const DMAMap *map);
>   
> -/**
> - * iova_tree_find_address:
> - *
> - * @tree: the iova tree to search from
> - * @iova: the iova address to find
> - *
> - * Similar to iova_tree_find(), but it tries to find mapping with
> - * range iova=iova & size=0.
> - *
> - * Return: same as iova_tree_find().
> - */
> -const DMAMap *iova_tree_find_address(const IOVATree *tree, hwaddr iova);
> -
> -/**
> - * iova_tree_foreach:
> - *
> - * @tree: the iova tree to iterate on
> - * @iterator: the iterator for the mappings, return true to stop
> - *
> - * Iterate over the iova tree.
> - *
> - * Return: 1 if found any overlap, 0 if not, <0 if error.
> - */
> -void iova_tree_foreach(IOVATree *tree, iova_tree_iterator iterator);
> -
>   /**
>    * iova_tree_alloc_map:
>    *
> diff --git a/util/iova-tree.c b/util/iova-tree.c
> index 536789797e..06295e2755 100644
> --- a/util/iova-tree.c
> +++ b/util/iova-tree.c
> @@ -115,13 +115,6 @@ const DMAMap *iova_tree_find_iova(const IOVATree *tree, const DMAMap *map)
>       return args.result;
>   }
>   
> -const DMAMap *iova_tree_find_address(const IOVATree *tree, hwaddr iova)
> -{
> -    const DMAMap map = { .iova = iova, .size = 0 };
> -
> -    return iova_tree_find(tree, &map);
> -}
> -
>   static inline void iova_tree_insert_internal(GTree *gtree, DMAMap *range)
>   {
>       /* Key and value are sharing the same range data */
> @@ -148,22 +141,6 @@ int iova_tree_insert(IOVATree *tree, const DMAMap *map)
>       return IOVA_OK;
>   }
>   
> -static gboolean iova_tree_traverse(gpointer key, gpointer value,
> -                                gpointer data)
> -{
> -    iova_tree_iterator iterator = data;
> -    DMAMap *map = key;
> -
> -    g_assert(key == value);
> -
> -    return iterator(map);
> -}
> -
> -void iova_tree_foreach(IOVATree *tree, iova_tree_iterator iterator)
> -{
> -    g_tree_foreach(tree->tree, iova_tree_traverse, iterator);
> -}
> -
>   void iova_tree_remove(IOVATree *tree, DMAMap map)
>   {
>       const DMAMap *overlap;

Reviewed-by: Thomas Huth <thuth@redhat.com>


