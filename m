Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sHmn3-0001Vq-AX
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jun 2024 11:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1sHmn2-0001V6-A3
 for qemu-trivial@nongnu.org; Thu, 13 Jun 2024 11:55:04 -0400
Received: from esa15.hc2706-39.iphmx.com ([216.71.140.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1sHmmw-0005Pa-6d
 for qemu-trivial@nongnu.org; Thu, 13 Jun 2024 11:55:04 -0400
X-CSE-ConnectionGUID: IiD7PvZPSVOo0Bk+jOpu1g==
X-CSE-MsgGUID: Qth9Nn6wQyK5czdv6ICo6A==
X-IronPort-RemoteIP: 209.85.222.200
X-IronPort-MID: 365582123
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:G/eSB64XOi2M/kFkbeyG8wxRtG3GchMFZxGqfqrLsTDasY5as4F+v
 mFOCGyFPq7ZYTOkfNh+b4vkpx9TvJWDmt9hSQY9pCFnEysa+MHIO4+lIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48D8hk/jOHuehYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMu8pvlDs15K6u4G1B5QRnDRx2lAS2e0c9Xcp3yZ6ZciOQrrl8RoaSW
 +vFxbelyWLVlz9FIs+liLvybnoRSbfUOwWU4lIOM0R1qkEfzsCa+v9T2Ms0MC+7uR3Q9zxC4
 IwlWaiLdOscFvakdNLx8vVvO3oW0aVuoNcrKJUk2CCZ5xSun3DEmp2CAKyqVGGxFyke7Wxmr
 JQlxD4xgh+rpuOan4qleNFXuOMkdOPof4E4omw5wmSMZRomacirr6Ti4NZZ2HIphZkLE6yGP
 4wWbj1gaBmGaBpKUrsVIMhmzaH42z+lKWce8grNzUY0yzG7IAhZ2bz9NtbPUtaXA8hZgy50o
 0qdoTmkUktDbof3JTyty26s18nJwzzCSaFPH6+06KBLq1rN7zlGYPERfR7hyRWjsWanVtdCb
 lAO+zQvpKwa8kutQd/gGRqirxa5UgU0XtNRF6gj61jIxPCMu0CWAW8LSjMHY9sj3CMreQEXO
 payt4uBLVRSXHe9EhpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:LYEIPKopgayU+RM+DjGNwFQaV5qaeYIsimQD101hICG9Lfb15r
 uTdaUguG6NtN9OYhtQ4OxoWJPwPk80kqQFk7X5XI3SKTUO3VHYUvAS0WKM+UyVJ8SVzJ856U
 4NSdkINDSTNykysS+K2njPLz9I+rDum9HN9JquvwYfcexzUdAd0+4eMHfRLqQffng9OXNTLu
 vV2iMonUvuRV0nKui9G3kZT6ziirTw5dzbiBQ9dlQawTjLojWy9rbgHhSUmjsYWShe2Kov/A
 H+/TAQ/s6YwpOGIuq27R6x032UorrcIxl4a/BkRvJlTQkEQzzJFeJcsmS5zX0ISTeUmRoXrO
 U=
X-Talos-CUID: 9a23:1iIabW0DZJ2AtXGTyBz/urxfO8EJLUXD/k/rHWi/UUxqC7+yUULJ9/Yx
X-Talos-MUID: 9a23:fQ9NogvYawmsBCQ/Ts2nvS1iZeFuvbuXGWNQmocKpZelHisuEmLI
Received: from mail-qk1-f200.google.com ([209.85.222.200])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Jun 2024 11:54:54 -0400
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7954f7742b8so143383085a.1
 for <qemu-trivial@nongnu.org>; Thu, 13 Jun 2024 08:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1718294094; x=1718898894; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=H/qCMwgn0nhGbT+NuzYYOoETEb1b8M8/gisRsLw1sYU=;
 b=F4Qkg8q1DOPWN1uzo4VVaAMnZ1iggfs70x2NxoDrNoJ975kgEFpbkaI4cHmsUUG5I3
 LgAOEDC7LrqhZm1Qfgr1pxsCtz+YUd9zTnBNd8JaaD0YTAr7tNOCRvP7DnDRKPGfEkuT
 8jG6C3zmymdfVwc/+a1jH1WD5bO5omvCFhox9LKRAqK/0dTxtVOlzDKd2OwYfW1uMTYM
 Or+bo8MA/irNYBBYdhNpCngx0U5QO482/lNLb260H/RxubvxuRILnPIgLbSrMMtqBtSR
 IOx7M2G7trkicRHHvWzneuNCqVTTjtnm+G0w80hmQai2SMBQpEOsgxs2mWyH9y+mVlgq
 z1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718294094; x=1718898894;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H/qCMwgn0nhGbT+NuzYYOoETEb1b8M8/gisRsLw1sYU=;
 b=pf506NYqejPrgwUsWwxBTS+TM5TQhjWkYUntQ/eeBqrAhgqXiITdZlCOuMdaZ9ypm3
 teU1HHTUg2cxU5XcNthtIMMEczKFR1EVI5cqJHWMvf/mhq7+iV7OSCbc8Tobm4s4vXIw
 w4J/cR55AMbrz+NnGSJ7vMoqmedL3QUruwEPqQ3w/jAQntsjy71FWu+YpaA6a0KKcacd
 k1RJE+7oIEdvXNO1MUwiuQzZYjJSTYgJINnRPnThggjTzYxAgKAzpma9wlOLaFxvca3W
 8W0c9bzvIbCgODzdj2kHBDVP0sDzG/3ZMVEPM0z4TPs2htxR6/5khmx3Ne2IJ4M/QBrw
 pFTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUv4+4GEnrV5PTcrUs1gtX0muZg84L0VfLK4KoL2WrJnBGuPq/S40t3zVuFfMd9P3lZqv7s7uXNm6ndevHDw+cDqHEB8BomA==
X-Gm-Message-State: AOJu0Yxn/vuQOCjEracKr0FGreDYbWxDw3o4K6Xh2kTAZ9h4tifefgRO
 0Yb4EMePoVO26N+Qg7Jn0czalyMUbFuOe68WT/keHd9bulXLAQd+dFosFlFRz8cKsJshf3nCW+s
 /LkWZ1E3fehVLOPZc+bN1zJqUfNQLuBfercruN3zNuzmTA1nbjE7t8rHcdUbruBzdjbzDObF1VJ
 Dz
X-Received: by 2002:a05:620a:4688:b0:795:47c6:79b1 with SMTP id
 af79cd13be357-797f602757amr518510585a.21.1718294093785; 
 Thu, 13 Jun 2024 08:54:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7Q4Am5Nw00uHGHvjIKW1skZW6+ZRm9PtNnDp5grAnmf9Tx6zT0IXH+aJNGvwY4pgwYZuDiQ==
X-Received: by 2002:a05:620a:4688:b0:795:47c6:79b1 with SMTP id
 af79cd13be357-797f602757amr518508785a.21.1718294093343; 
 Thu, 13 Jun 2024 08:54:53 -0700 (PDT)
Received: from mozz.bu.edu (pool-173-48-150-109.bstnma.fios.verizon.net.
 [173.48.150.109]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798abc03812sm62532685a.93.2024.06.13.08.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 08:54:53 -0700 (PDT)
Date: Thu, 13 Jun 2024 11:54:48 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Dmitry Frolov <frolov@swemel.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, sdl.qemu@linuxtesting.org
Subject: Re: [PATCH] tests/qtest/fuzz/virtio_net_fuzz.c: fix
 virtio_net_fuzz_multi
Message-ID: <20240613155448.5m6zuv2idqbbpnf2@mozz.bu.edu>
References: <20240523102813.396750-2-frolov@swemel.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240523102813.396750-2-frolov@swemel.ru>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.200; envelope-from=alxndr@bu.edu;
 helo=esa15.hc2706-39.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.001, SPF_HELO_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 13 Jun 2024 15:55:04 -0000

This fixes the almost-immediate timeout issue for me on the
virtio_net_fuzz target, but I'm not sure why this works or if it is
fixing the right problem:

qtest_probe_child is designed to run from a libqtest process which
uses waitpid on the PID of the child (qemu) process (stored in
QTestState->qemu_pid) . With qemu-fuzz we do not have a separate
libqtest and qemu process:

(gdb) p s->qemu_pid
$1 = 0

So we are calling waitpid with pid = 0. From the man-page:
"0 meaning wait for any child process whose process group ID is equal to
that of the calling process at the time of the call to waitpid()."

And we are calling it with WNOHANG. So I would expect that this almost
always returns 0 unless some adjacent thread has changed state
(libfuzzer uses extra threads to manage timeouts).

I'm happy that the fuzzer works again, and am happy to leave a review,
but I would like to first understand what the behavior of
qtest_probe_child here is, since it isn't really designed to work with
the fuzzer.

On 240523 1328, Dmitry Frolov wrote:
> If QTestState was already CLOSED due to error, calling qtest_clock_step()
> afterwards makes no sense and only raises false-crash with message:
> "assertion timer != NULL failed".
> 
> Signed-off-by: Dmitry Frolov <frolov@swemel.ru>
> ---
>  tests/qtest/fuzz/virtio_net_fuzz.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/qtest/fuzz/virtio_net_fuzz.c b/tests/qtest/fuzz/virtio_net_fuzz.c
> index e239875e3b..2f57a8ddd8 100644
> --- a/tests/qtest/fuzz/virtio_net_fuzz.c
> +++ b/tests/qtest/fuzz/virtio_net_fuzz.c
> @@ -81,6 +81,9 @@ static void virtio_net_fuzz_multi(QTestState *s,
>          /* Run the main loop */
>          qtest_clock_step(s, 100);
>          flush_events(s);
> +        if (!qtest_probe_child(s)) {
> +            return;
> +        }
>  
>          /* Wait on used descriptors */
>          if (check_used && !vqa.rx) {
> -- 
> 2.43.0
> 

