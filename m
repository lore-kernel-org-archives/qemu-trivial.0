Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r3dJC-00016R-EP
	for mharc-qemu-trivial@gnu.org; Thu, 16 Nov 2023 09:25:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1r3dJ9-00015X-1U
 for qemu-trivial@nongnu.org; Thu, 16 Nov 2023 09:25:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1r3dJ5-00055w-Eo
 for qemu-trivial@nongnu.org; Thu, 16 Nov 2023 09:25:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700144722;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=9Wqc4E+SeAwYIqfSAukcWD+ySCBrSbiPEqBz02d6V84=;
 b=bq0IJAEQH90Kit8FRM54+rtWq4//3zpS5qk93qlJzrt1BllqtZscv9iNSwRgKEIVgV2cHS
 UBqOTUcIQ9xYJzO1vTpb3w74PKFXLx0AnmK9svmYZ2czoSxJrA0CnxW00uDHdB7rpN6cw1
 gyeoyJ+0DVNIBd4YF9YiR6wlAEAabRc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-MVNs73EuNSOU1Yw5dzaU5A-1; Thu, 16 Nov 2023 09:25:21 -0500
X-MC-Unique: MVNs73EuNSOU1Yw5dzaU5A-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-32fd5f7b674so401336f8f.0
 for <qemu-trivial@nongnu.org>; Thu, 16 Nov 2023 06:25:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700144719; x=1700749519;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Wqc4E+SeAwYIqfSAukcWD+ySCBrSbiPEqBz02d6V84=;
 b=XMKrZ8bi/R25mX+uJSj0XpZmDF3pZ2IQw96Ef0ba5RGXkLjRCUd0qArTCn7a+XFYYF
 31spG6LMb5bz9yLL1ZirDHv/2S+P9+FMKRIz5McCcFW6I0sIrYsvFZFB+vxksunG/Pzk
 JLHgU3hbbtgsTuXDAezPJFgbVjLMYzy14w5/N/rSsiO37o9zKCXzvsuLXpzb8YinYRkE
 vVAFASRVl92OEgxHnkPCYKk9ZwJnSuMBsQ5ACrIA4VT8EAtD0Cf90D55xP5jKYhUhNGq
 pwrir5scXaFrokcrGmAejrnIlEB1DnOn45SsUhDl9N8PXkjLpiNF2ZOpi0buoitK6MpG
 RQhw==
X-Gm-Message-State: AOJu0Yx6H1NGM85qAjMOx7DdS+aiu4SdSZY3ZMwfcmeeUkGQpQdOXNgJ
 QxfWudyVbf7Frd/zxxsfiYxM7bVsS+ZiJvg8CGacGfvy2ze624MW6k4yAFQOGuuHbnc4VfctdiZ
 W5N/YukDeq3e1ZAlnhw==
X-Received: by 2002:a05:6000:1202:b0:32d:9332:8168 with SMTP id
 e2-20020a056000120200b0032d93328168mr9553772wrx.54.1700144718939; 
 Thu, 16 Nov 2023 06:25:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2hJYbPl5LELqVowgZnw8wcrp+SpAt3TRIjwzAJRyt5kviG4OarmvmfXVtetLwwbRPzvxcxA==
X-Received: by 2002:a05:6000:1202:b0:32d:9332:8168 with SMTP id
 e2-20020a056000120200b0032d93328168mr9553760wrx.54.1700144718593; 
 Thu, 16 Nov 2023 06:25:18 -0800 (PST)
Received: from redhat.com (static-151-150-85-188.ipcom.comunitel.net.
 [188.85.150.151]) by smtp.gmail.com with ESMTPSA id
 d3-20020adfa403000000b00331424a1266sm13620210wra.84.2023.11.16.06.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 06:25:18 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org,  qemu-trivial@nongnu.org
Subject: Re: [PATCH trivial 05/21] docs/about/deprecated.rst: spelling fix:
 becase
In-Reply-To: <20231114165834.2949011-6-mjt@tls.msk.ru> (Michael Tokarev's
 message of "Tue, 14 Nov 2023 19:58:18 +0300")
References: <20231114165834.2949011-1-mjt@tls.msk.ru>
 <20231114165834.2949011-6-mjt@tls.msk.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Thu, 16 Nov 2023 15:25:17 +0100
Message-ID: <87edgprd0y.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.117,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 16 Nov 2023 14:25:28 -0000

Michael Tokarev <mjt@tls.msk.ru> wrote:
> Fixes: 864128df465a "migration: Deprecate old compression method"
> Cc: Juan Quintela <quintela@redhat.com>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  docs/about/deprecated.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 78550c07bf..6c84db90b5 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -514,5 +514,5 @@ old compression method (since 8.2)
>  
>  Compression method fails too much.  Too many races.  We are going to
>  remove it if nobody fixes it.  For starters, migration-test
> -compression tests are disabled becase they fail randomly.  If you need
> +compression tests are disabled because they fail randomly.  If you need
>  compression, use multifd compression methods.

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


