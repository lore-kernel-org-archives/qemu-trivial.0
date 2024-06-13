Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sHmnX-0002XS-B6
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jun 2024 11:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1sHmnV-0002U4-Om
 for qemu-trivial@nongnu.org; Thu, 13 Jun 2024 11:55:33 -0400
Received: from esa5.hc2706-39.iphmx.com ([216.71.137.63])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1sHmnU-0005kq-3G
 for qemu-trivial@nongnu.org; Thu, 13 Jun 2024 11:55:33 -0400
X-CSE-ConnectionGUID: ttuJcUwkT5G8gO4MqrB20g==
X-CSE-MsgGUID: QQLuEOITQW+tAGH3M0XW9A==
X-IronPort-RemoteIP: 209.85.222.198
X-IronPort-MID: 384318211
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:OuO7u6NHVx/6CzTvrR3wlsFynXyQoLVcMsEvi/4bfWQNrUoj3zVSz
 DQZWj3TP6qNNmD3ft1zaYzg9RkBuJODzdJkGQZtpSBmQkwRlceUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0rrb/646yEhiMlkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEAHjg24c3l48sfrZ9Esx5a+q4Vv0g3RlDRx1lA6G/5UqJM9HTU2BByOQapVZGOe8W
 9HCwNmRlkvF/w0gA8+Sib3ydEsHWNb6ZWBiXVIPBsBOKjAbzsAD+v9T2Mg0MC+7uB3Q9zxF8
 +ihgLTrIesf0gwgr8xGO/VQO3kW0aSrY9YrK1Dm2SCY5xSun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACwRczKIuv21/O+UGuZL2uE6NuOxZIxK7xmMzRmBZRonaZXKQqGP/NwBmTlp15AIEvHZa
 M4ULzFoaXwsYTUVYgZRWM94xr3ywCCuI1W0q3rMzUYzy2HX3Ap9ypDnLZzYdsHiqcB9xRbE/
 TuWpT2gav0cHOWm7Seo1VOQv9CMgQrUeNk3TI2Hp9c/1TV/wURWUnX6T2CTuPS8lwuiQdNBK
 kUQ0iwpq6c06QqsVNaVYvGjiHuNvxpZQtkJVuNjuVHLxa3T7AKUQGMDS1atdeAbiSP/fhRyv
 nfhoj8jLWYHXGG9IZ5FyoqpkA==
IronPort-HdrOrdr: A9a23:BJAVwKCG7nmjw7TlHemU55DYdb4zR+YMi2TDsHoBKyC9E/bo9P
 xG885w6faZslsssRIb+exoWpPvfZq0z/ccirX5W43PYOCMggqVxe9ZgrcKuweQfxHWx6p42b
 17e6ZzKNCYNykcsS+A2njcL+od
X-Talos-CUID: 9a23:4sI1UWAxEinYmZ76EzV76WwfJ98mTiDynHj3f2qhE0wzELLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AODs5hw20Ei7luMt9E8P171hG4TUj2p2KFW0qsKk?=
 =?us-ascii?q?/hIqYHANQYBLFvAvma9py?=
Received: from mail-qk1-f198.google.com ([209.85.222.198])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Jun 2024 11:55:29 -0400
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7954f7742b8so143481485a.1
 for <qemu-trivial@nongnu.org>; Thu, 13 Jun 2024 08:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1718294129; x=1718898929; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dhbyvWGT16zVh2jUWMQRnzM3yNBcoG2ynfy9femxJSs=;
 b=KlHg1GhzbAgMFRNUYh119JfdRECE25uLc0BsXAm183y1ZXy7qebjF5AVrg0eqOxUAw
 JofCdV2e5MG4oCdP4956RL4j8InhhhcVkdzYONGNMg2Y4zsbpY6wVLaMwUmiiAcAesji
 9RKpA7QSuMCEWfCXWAo0flKZsusNIstMOLOYf1edoaECJch3A9Iah7+sywdbY0EqeLLt
 Po/N+PeT4sy4OA2uyY7vRsRevnkjbPi3jxf9/fPs6xMH++UjobuFVPpWwQF1OZK8WmYD
 9CoXS9Gb/NzygpQF6zoY5/LeBIflJ0mVubhaaGHZvSrniNiyr1IMx/xidftjbODrUt3B
 2WCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718294129; x=1718898929;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dhbyvWGT16zVh2jUWMQRnzM3yNBcoG2ynfy9femxJSs=;
 b=tk/BO1FjTPQt3daBtF927l9pzcjwQlJwlQ1wxQvyeJZjJwhrvGGf+OzPDlEY05h8/s
 0/T5KBPb76hOYqKCFoJHEgLK3m8Jr9ftMYObUqgblRl4zomfGXHIcokJNDFKIqW7kREB
 hq02vZp9sikH4oDKBm8QuChg5MaCICg0CQvAe2EujLRmkXoWVWGz9I/5CQzNpV1GJGFY
 FutickttmB2fHZA7PYJ+UOapBm3MZz4Y29MWUlR4PnC0wKmVm9/7nBdYyiORk7nj8o9q
 aymXxDBvY7Gus7G5zUSHAkc1Ihs8C+HGLxG8R0Q+LglER6gDb8TXiDTMAyIBYJI+xUDz
 LO7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJEwn1oZjPfPEW+/nCiDmhzV1LXh62IM46PEnJ2i5kTXA0b1GENPLrXQwx1IhLV+DzLhMmzonJzgdmDJWaxK3Bpcb2+XBymQ==
X-Gm-Message-State: AOJu0Yx7ZVDuABgHUNGxxrjZ9VLDER3aBR/wxhCbzYKjGXSOWY5sKyBL
 Z2HDq5i1q+K1Naqj3zwYB3d/9NQ6XvFhg+3aYuSBSwjqmtH6i5UBjVmV5rACnKx5ol166fSZ6er
 1m0ijjDUqznTkrrx2jR+Jc5fmUow7n4QGiEqV+TwvUnCunOA2LIrFUTSaejY2LJs85u79YCQVKK
 1+
X-Received: by 2002:a05:620a:4092:b0:797:d55a:516a with SMTP id
 af79cd13be357-797f6128e9amr615460185a.60.1718294129172; 
 Thu, 13 Jun 2024 08:55:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVnNSsBqQumuKErOIPO1AOzElnbyOBQjWu6ICerdzGD/8I8I/CGitjbX+RujkwsZLe0qMEVQ==
X-Received: by 2002:a05:620a:4092:b0:797:d55a:516a with SMTP id
 af79cd13be357-797f6128e9amr615457485a.60.1718294128736; 
 Thu, 13 Jun 2024 08:55:28 -0700 (PDT)
Received: from mozz.bu.edu (pool-173-48-150-109.bstnma.fios.verizon.net.
 [173.48.150.109]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798c39d8cafsm41860885a.127.2024.06.13.08.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 08:55:28 -0700 (PDT)
Date: Thu, 13 Jun 2024 11:55:24 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Dmitry Frolov <frolov@swemel.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, sdl.qemu@linuxtesting.org
Subject: Re: [PATCH] tests/qtest/fuzz: fix memleak in qos_fuzz.c
Message-ID: <20240613155524.ldxi3zjvsj2l4bnf@mozz.bu.edu>
References: <20240521103106.119021-3-frolov@swemel.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521103106.119021-3-frolov@swemel.ru>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.63; envelope-from=alxndr@bu.edu;
 helo=esa5.hc2706-39.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 13 Jun 2024 15:55:34 -0000

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

On 240521 1331, Dmitry Frolov wrote:
> Found with fuzzing for qemu-8.2, but also relevant for master
> 
> Signed-off-by: Dmitry Frolov <frolov@swemel.ru>
> ---
>  tests/qtest/fuzz/qos_fuzz.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/qtest/fuzz/qos_fuzz.c b/tests/qtest/fuzz/qos_fuzz.c
> index b71e945c5f..d3839bf999 100644
> --- a/tests/qtest/fuzz/qos_fuzz.c
> +++ b/tests/qtest/fuzz/qos_fuzz.c
> @@ -180,6 +180,7 @@ static void walk_path(QOSGraphNode *orig_path, int len)
>  
>          fuzz_path_vec = path_vec;
>      } else {
> +        g_string_free(cmd_line, true);
>          g_free(path_vec);
>      }
>  
> -- 
> 2.43.0
> 

