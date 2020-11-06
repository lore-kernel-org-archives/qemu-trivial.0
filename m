Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kb4ua-00076S-1c
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2020 11:48:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kb4uU-00075a-86
 for qemu-trivial@nongnu.org; Fri, 06 Nov 2020 11:48:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kb4uR-00051g-ID
 for qemu-trivial@nongnu.org; Fri, 06 Nov 2020 11:48:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604681295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FxRn1SV0tEERrwfDvB8iMmSyym/77PXUc9iRMHBPQhY=;
 b=Vit5hs35IqAM8dT3bdW32uo91clzeFf+IOMbHIKJl1iP3jCheAo+g9mBazkiEWhLpqJ4b6
 7k0HBlaXwKPQuz9LK+5xELlhMcPJnAbEhz/iWPiywtI6G+UGkiowupY5QOnYLp8zC3m1RY
 HdK0YM5VtP/Ah3JqojdB3R0kLONnIEg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-KpGWZeTPOZiIB2P0BTFPMQ-1; Fri, 06 Nov 2020 11:48:14 -0500
X-MC-Unique: KpGWZeTPOZiIB2P0BTFPMQ-1
Received: by mail-wm1-f69.google.com with SMTP id u207so659648wmu.4
 for <qemu-trivial@nongnu.org>; Fri, 06 Nov 2020 08:48:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FxRn1SV0tEERrwfDvB8iMmSyym/77PXUc9iRMHBPQhY=;
 b=n9IFaU+ZP+lbSMCmdvx9pBdpT21SQGZIk+KvjKASPSLHl6WaX22CFuXvttec422chL
 D1jY26pTjcK9RaQp1pX2ktt+r3E9beOL38c1tB6xvqlBHK1BM2r9ew/xt0+E+DVjX8Ml
 ysmrT+3qOo0v8Gm530vPbDuJccdrzGeN1nsxdfR5/sltkAiBBS2nNpNNhXCQuXh43amb
 ls3rbObfYJY31emsK148Wa1D2aS/YhfOn6Po6WZqAuVfU25Q5Hm9AiaHPI5bmA8XxivJ
 dfjZCgervA7qkYsu0DYEaJ7CVHImQM2GxpOBgoTvW/VLiwTrFOEFZ1mXTQRdsRFZJgul
 +Klg==
X-Gm-Message-State: AOAM532zJcpyaNu9N0PsWxTU7sEAUV7wbTlqTn8Gkd8YWldVeMoVr/py
 M62vRjf27fbNEPZKn//62QL7yRhFTWXaId2LHE68PGmvWyFPDaYjhkf7+0a/1yrtNGkdMWkb9i1
 gvW7uUGLZqN/R34XrtQ==
X-Received: by 2002:a7b:c349:: with SMTP id l9mr500939wmj.148.1604681292796;
 Fri, 06 Nov 2020 08:48:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGR/VYM9Jni3hg/PS84G3gpDxwNqpYSpe3OrH4azJ4WWJv51OR9Vs+r4mtinyWoi6YndSTWg==
X-Received: by 2002:a7b:c349:: with SMTP id l9mr500915wmj.148.1604681292592;
 Fri, 06 Nov 2020 08:48:12 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id h4sm2855871wrp.52.2020.11.06.08.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 08:48:10 -0800 (PST)
Date: Fri, 6 Nov 2020 11:48:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Gan Qixin <ganqixin@huawei.com>
Subject: Re: [PATCH] CODING_STYLE.rst: Be less strict about 80 character limit
Message-ID: <20201106114740-mutt-send-email-mst@kernel.org>
References: <20201106112940.31300-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20201106112940.31300-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/06 06:30:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 06 Nov 2020 16:48:23 -0000

On Fri, Nov 06, 2020 at 11:29:40AM +0000, Peter Maydell wrote:
> Relax the wording about line lengths a little bit; this goes with the
> checkpatch changes to warn at 100 characters rather than 80.
> 
> (Compare the Linux kernel commit bdc48fa11e46f8; our coding style is
> not theirs, but the rationale is good and applies to us too.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  CODING_STYLE.rst | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/CODING_STYLE.rst b/CODING_STYLE.rst
> index 8b13ef0669e..7bf4e39d487 100644
> --- a/CODING_STYLE.rst
> +++ b/CODING_STYLE.rst
> @@ -85,8 +85,13 @@ Line width
>  Lines should be 80 characters; try not to make them longer.
>  
>  Sometimes it is hard to do, especially when dealing with QEMU subsystems
> -that use long function or symbol names.  Even in that case, do not make
> -lines much longer than 80 characters.
> +that use long function or symbol names. If wrapping the line at 80 columns
> +is obviously less readable and more awkward, prefer not to wrap it; better
> +to have an 85 character line than one which is awkwardly wrapped.
> +
> +Even in that case, try not to make lines much longer than 80 characters.
> +(The checkpatch script will warn at 100 characters, but this is intended
> +as a guard against obviously-overlength lines, not a target.)
>  
>  Rationale:
>  
> -- 
> 2.20.1


