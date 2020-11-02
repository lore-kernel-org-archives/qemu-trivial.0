Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZYR9-0003Zz-Sb
	for mharc-qemu-trivial@gnu.org; Mon, 02 Nov 2020 06:55:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kZYR8-0003Zs-LJ
 for qemu-trivial@nongnu.org; Mon, 02 Nov 2020 06:55:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kZYR6-0002gl-PA
 for qemu-trivial@nongnu.org; Mon, 02 Nov 2020 06:55:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604318143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=byB6Fo+xWPOZENbYpwNc+fejH+A8uFdFlnKg90/yJq4=;
 b=CIscF0dJiwLY/RwaRenT5fgGN9mFfC89EqrccyYHr/9A3yOl4xXnGMXKdskptJ2Jzm6cD3
 dGXbvbqs7VEaslxTZ4xnVlhAS3+WM1Hh0PdQ4EilsFRC2jWyHIbP7HRJ9oJp+OJ2HkzpKe
 B6WtlNQBuaEWkG480NTYHzrG/kTO/f4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-o9odTN9NPROKjOeBQY2tEw-1; Mon, 02 Nov 2020 06:55:41 -0500
X-MC-Unique: o9odTN9NPROKjOeBQY2tEw-1
Received: by mail-ej1-f70.google.com with SMTP id nt22so1168115ejb.17
 for <qemu-trivial@nongnu.org>; Mon, 02 Nov 2020 03:55:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=byB6Fo+xWPOZENbYpwNc+fejH+A8uFdFlnKg90/yJq4=;
 b=R7gaCE+lrysVzPdgrH4O0MKF6x/7nxIpad2qdDO0HrlCLjBhqveAsePsGathhwWIX9
 /Z4TCwqbmISKKnMq/PRAzLyQ9uUgJQgQ9hTh0Catc5UW87sdAcTKm8Y+IrLUXW70n3ej
 Wa3cQ4uvUFmatKh6Xy5VaZAE3r2RzDo1zc6Rh4YgYMXP/VoOuvYUw57pDSIldxweBELm
 fO5Etb/4ge6aqWtjE6YithNj+15x6Zc/KozSemcCFl8CQseWkMrYnLx4njXCNq2Dnzvy
 w4eVT1g/GxWFsZ+xMCle5Dlk64s71sC+v7jT+gF2dm9KpLg8B8+rnPjZX4RHRVnjx6mh
 DtXw==
X-Gm-Message-State: AOAM531yvrbMMW5KoLDI+C03L4chZFLmtCJbSIuXpg2kM9c1wwf3AsaL
 3d4XuFmAUEAX2rMKnr0AhZ0ANiOrky6qwbRCXzBq4wglXGmDldGRCfGZiZ8dL49EHaLhPvBg8j3
 bEwiCqdE+SWIYd1shUQ==
X-Received: by 2002:a5d:448b:: with SMTP id j11mr19506964wrq.129.1604317350274; 
 Mon, 02 Nov 2020 03:42:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWPCflAGzCLPXdm4rjGOZqwX0yW1OOmDwZZ5SCi2CIWuGj/UFCmswpVRlnQsWtkfsUQNRtbg==
X-Received: by 2002:a5d:448b:: with SMTP id j11mr19506952wrq.129.1604317350115; 
 Mon, 02 Nov 2020 03:42:30 -0800 (PST)
Received: from steredhat (host-79-22-200-33.retail.telecomitalia.it.
 [79.22.200.33])
 by smtp.gmail.com with ESMTPSA id m8sm21542322wrw.17.2020.11.02.03.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:42:29 -0800 (PST)
Date: Mon, 2 Nov 2020 12:42:27 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] hw/input/ps2.c: Remove remnants of printf debug
Message-ID: <20201102114227.ogssja4k53qj2abz@steredhat>
References: <20201101133258.4240-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20201101133258.4240-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 01:33:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Mon, 02 Nov 2020 11:55:46 -0000

On Sun, Nov 01, 2020 at 01:32:58PM +0000, Peter Maydell wrote:
>In commit 5edab03d4040 we added tracepoints to the ps2 keyboard
>and mouse emulation. However we didn't remove all the debug-by-printf
>support. In fact there is only one printf() remaining, and it is
>redundant with the trace_ps2_write_mouse() event next to it.
>Remove the printf() and the now-unused DEBUG* macros.
>
>Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>---
> hw/input/ps2.c | 9 ---------
> 1 file changed, 9 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


