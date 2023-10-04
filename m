Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qo1ML-0006lq-6X
	for mharc-qemu-trivial@gnu.org; Wed, 04 Oct 2023 08:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qo1MI-0006eo-E6
 for qemu-trivial@nongnu.org; Wed, 04 Oct 2023 08:52:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qo1M6-0008DO-NZ
 for qemu-trivial@nongnu.org; Wed, 04 Oct 2023 08:52:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696423918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qGdglon1Zs+pnb5l/RnG/GPzbCq6NT0L0EIyzzkONb4=;
 b=UEw2y5MSyRdfiQHmY0tWqOFmGRyQhr5IebMqjH9RL1txjZPmfcoitH1D7k6ISHJb86bauB
 f8GzepKzG5nA3CfqJHLhhTCUZM4fz1n33Q4/MtzdsXEO9qTYfDSURNFxLV1f0ZkBsDwG/F
 cXYlY4bOKBN28bflq1vQaGFKGNcQbQ0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-rGRN3k6COueSkfyTFEjrTw-1; Wed, 04 Oct 2023 08:51:47 -0400
X-MC-Unique: rGRN3k6COueSkfyTFEjrTw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-323334992fbso1524579f8f.1
 for <qemu-trivial@nongnu.org>; Wed, 04 Oct 2023 05:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696423905; x=1697028705;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qGdglon1Zs+pnb5l/RnG/GPzbCq6NT0L0EIyzzkONb4=;
 b=F9XQkwJRkmPkBwtJT+fzV+2hjZqwNjavHxtsxVpyvkaBHxw7mlUQ5pDBavmReo+gej
 8ZwFlMIC1kTATBFj4vcyFUYZ6azoCwSn6PJQuEtbUAkSmO+Jf6mQi7nocOIjKdfThVJQ
 fKHMRulJa/KGN+rQZbhpnus9ivw4T209duKp/pXceCvmXCfvHeig/oMdNgUA5mUavd1s
 PbkYa6pYO4/6QEZUPEBFDKWFIqXqjKxIdz5gUrx5yFTkyPVQvpZIKgPegfNtpl+LMtV6
 As743Qv4vwD+rZCa/zB5V9ZRkbR163MZzpnCe17EUm1WbW48msuQDZntUrMGYsMeqq4U
 /ScQ==
X-Gm-Message-State: AOJu0YxZKiyYDR1SuuMtGux60n62ge8nNEUYjmmApIuyYglW+LYzTo7i
 W4uuyRAMcGPKfzj+SEaeTfJlCwSzBwTGYrvKwIG1gCC2hPogTGKjoAMozbFgjhKU3NJwD0xR2DM
 kf4TARaZ9erVOAjri1cf1h9Q6PQ==
X-Received: by 2002:a5d:630c:0:b0:31f:fa6a:936e with SMTP id
 i12-20020a5d630c000000b0031ffa6a936emr2076353wru.17.1696423905650; 
 Wed, 04 Oct 2023 05:51:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrTPs9+fN1lfdMLKE7q5AAsPHBzgxhRHCHdN5ZoQ4fS5XsOO3735sEdM6r1n4ycPczTSPVlg==
X-Received: by 2002:a5d:630c:0:b0:31f:fa6a:936e with SMTP id
 i12-20020a5d630c000000b0031ffa6a936emr2076338wru.17.1696423905342; 
 Wed, 04 Oct 2023 05:51:45 -0700 (PDT)
Received: from redhat.com ([2a02:14f:173:37ff:87f3:445a:631e:51a5])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a7bc450000000b0040536dcec17sm1463388wmi.27.2023.10.04.05.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 05:51:44 -0700 (PDT)
Date: Wed, 4 Oct 2023 08:51:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] hw/virtio/vhost: Silence compiler warnings in vhost code
 when using -Wshadow
Message-ID: <20231004085134-mutt-send-email-mst@kernel.org>
References: <20231004114809.105672-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20231004114809.105672-1-thuth@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 04 Oct 2023 12:52:12 -0000

On Wed, Oct 04, 2023 at 01:48:09PM +0200, Thomas Huth wrote:
> Rename a variable in vhost_dev_sync_region() and remove a superfluous
> declaration in vhost_commit() to make this code compilable with "-Wshadow".
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


> ---
>  hw/virtio/vhost.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index e2f6ffb446..9cfac40fde 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -66,12 +66,12 @@ static void vhost_dev_sync_region(struct vhost_dev *dev,
>                                    uint64_t mfirst, uint64_t mlast,
>                                    uint64_t rfirst, uint64_t rlast)
>  {
> -    vhost_log_chunk_t *log = dev->log->log;
> +    vhost_log_chunk_t *dev_log = dev->log->log;
>  
>      uint64_t start = MAX(mfirst, rfirst);
>      uint64_t end = MIN(mlast, rlast);
> -    vhost_log_chunk_t *from = log + start / VHOST_LOG_CHUNK;
> -    vhost_log_chunk_t *to = log + end / VHOST_LOG_CHUNK + 1;
> +    vhost_log_chunk_t *from = dev_log + start / VHOST_LOG_CHUNK;
> +    vhost_log_chunk_t *to = dev_log + end / VHOST_LOG_CHUNK + 1;
>      uint64_t addr = QEMU_ALIGN_DOWN(start, VHOST_LOG_CHUNK);
>  
>      if (end < start) {
> @@ -549,7 +549,7 @@ static void vhost_commit(MemoryListener *listener)
>          changed = true;
>      } else {
>          /* Same size, lets check the contents */
> -        for (int i = 0; i < n_old_sections; i++) {
> +        for (i = 0; i < n_old_sections; i++) {
>              if (!MemoryRegionSection_eq(&old_sections[i],
>                                          &dev->mem_sections[i])) {
>                  changed = true;
> -- 
> 2.41.0


