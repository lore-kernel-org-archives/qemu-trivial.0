Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tOIm0-0006Ir-La
	for mharc-qemu-trivial@gnu.org; Thu, 19 Dec 2024 10:49:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tOIji-0006CF-VR
 for qemu-trivial@nongnu.org; Thu, 19 Dec 2024 10:46:50 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tOIjh-0005vI-KD
 for qemu-trivial@nongnu.org; Thu, 19 Dec 2024 10:46:50 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5d7e3f1fc01so1741389a12.2
 for <qemu-trivial@nongnu.org>; Thu, 19 Dec 2024 07:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734623207; x=1735228007; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ONHbH48quKQ6AaGNzJcEegS0OWBBUfyvhqjz9Ljd4SE=;
 b=Mz7x+HhtjCIO86hhNVMKAzArtKIJVb2bOkyaS163DZee7ASA+cMOnNIv6bcgKQ+NmU
 HEdgMqczW2kw7I6T3pYKVfLAc3GpiwyeGSiHjqVYXMX+KcanRkL2bynNvYH9pRQkSHlJ
 x9QPc+PIdGdLEr42mQFUWLE/hB0iWF0UR3KDc8j9c01j0wWCCBXuGKnR1bdV8JF3bmwr
 rwSUao6+c8jB1Ge/PRIAaV9os5nqQ3ZAJS2iXIV9+LXhbrqcEywb1zXCGqGhGjP0aQoh
 /IM/5rDJuemmdegFi+Vse5vWuXpXikrjqJoCTDI+1Kv8BBNfw+9v+Z9yVM9PO71VpShk
 isaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734623207; x=1735228007;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ONHbH48quKQ6AaGNzJcEegS0OWBBUfyvhqjz9Ljd4SE=;
 b=Xv4A9Fee/tVyOkkJqQuFmPFCoZXUgeYlAxfD7LjiZ3iSayMG6ErDcMOCftJ2w/fjT6
 V/QXraYigO8qaorLPQldzAEobtkj48Q4vA9u1Ig7o9kb2cKZjtebKarFG2vc6vzr6EJY
 472THfvzdbMdEmI2Jigyv+zVfsq2X5r+Ph2HJI/j6kCeeYDFYDigGh5g9Op6NxWfUWTA
 LNG6hO6ryQOWLfzXi2xB4Yk1fRJt2oCp5z7E3TEPn0ElDeLcNSC3S3eqm4b5OC7SgzcV
 FNeW13/8QbJ38bl6d0ExlxgYk4kR4OW0OPs52JKRWyQX/e3d7S0u395PD1qWBSSd3pHO
 M2KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO+6xJT7yX2CgiIWgnD67TJiMntP6aMUsPV1Rw/RFKgAfF12/LEIJcS58t/MomXG/a+bOs4c1hOD1QAoI=@nongnu.org
X-Gm-Message-State: AOJu0YzaTRDkeoriuEy80wlUFFe1oUHG62dQMJrGXBCzLwi7A80Mf51C
 D/IpcSXAXjtVpt+gZZgYteWuMwEkQg4uqfq3zLEhzgXD9xaAGQFu6M4u8CezgZo=
X-Gm-Gg: ASbGnctFBFvL4NNd9lY+t3qkIWutZlqhiGzd8qx+AouzLEBdDxwzpFwgQVOa4XqQVfM
 IJEQqqStX+IAlyHWKEtVxamcC+3UzhU7Ht3gbjHM4EHic52yu6YBN5zbe4rHJG4PonUaZ+63wZ4
 V0HG5ymcg4hjBgt8YhJ6LMuTVmeCbgZ+TktsAa2nHjY7o0WlFCdOLZF/mMZ34hcqBpkaysXXspA
 N0FXPHM2QQRT67j+UpenLxZIm+QtKrdTbq3ebkBWDEkfX3YyA8r8mk=
X-Google-Smtp-Source: AGHT+IGnQT502O+Kml/uyr5waEO0W78aSOBOMLOsFd22TIRhk9432XeqJxHtb4Se+0kSNPecDHc36g==
X-Received: by 2002:a05:6402:5385:b0:5cf:43c1:6ba7 with SMTP id
 4fb4d7f45d1cf-5d802852dd3mr2997896a12.30.1734623207040; 
 Thu, 19 Dec 2024 07:46:47 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d80676eecfsm798659a12.19.2024.12.19.07.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 07:46:45 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0CCBD5F867;
 Thu, 19 Dec 2024 15:46:45 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>,  devel@lists.libvirt.org,  Laurent
 Vivier <laurent@vivier.eu>,  qemu-trivial@nongnu.org
Subject: Re: [PATCH 3/3] docs: Replace 'since' -> 'removed in' in
 removed-features.rst
In-Reply-To: <20241219150203.55212-4-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 19 Dec 2024 16:02:03
 +0100")
References: <20241219150203.55212-1-philmd@linaro.org>
 <20241219150203.55212-4-philmd@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 19 Dec 2024 15:46:45 +0000
Message-ID: <87ed233cbe.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 19 Dec 2024 15:46:51 -0000

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

