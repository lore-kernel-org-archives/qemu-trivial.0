Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tXexj-0000Uy-VZ
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jan 2025 06:19:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tXewG-0008GO-PI
 for qemu-trivial@nongnu.org; Tue, 14 Jan 2025 06:18:35 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tXewD-0002Oj-Ff
 for qemu-trivial@nongnu.org; Tue, 14 Jan 2025 06:18:27 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-386329da1d9so2765461f8f.1
 for <qemu-trivial@nongnu.org>; Tue, 14 Jan 2025 03:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736853503; x=1737458303; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HLUl16iu9ZaWgnMcCLuJzL1lNH5QA/MRjLUjtmH++D8=;
 b=y2vNJPhCf74oxed+lDvr4pVuViaQH+V6tCYwYysKEJCrDS5TK/b+vMDd9F6YevAxu/
 4RFuUDj9blPseQGl9DdlVVY8OO067coA5CKxuqr7Ha1klf04+hvoKPMOIqS88/J05bsT
 wejUsHgBaRCW6tH9Bmb5aDiE4rxoxyTbaUJvxTWBRx+ZlCQD8voIiZb6xS+OfWXlTEfc
 qR7V54xFZt5ZnY2JfO3SSbt0RijaFUcVzTuqA0NFu7agNdDWVL5TYPPBxBGsrS4rx9Ll
 jMHbmZmXVAK+vtErGTPNA0DR6YH6IBx9pAdy/DCE4o0tLOYrikRkqjs1LPM7zbr1enTt
 zxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736853503; x=1737458303;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HLUl16iu9ZaWgnMcCLuJzL1lNH5QA/MRjLUjtmH++D8=;
 b=hO+CrE4FUh6E3lbSU0E4WFO3RqkUuTN68Qga+gGRDQkPo/+mGNPpmvhD0zUeTvZDQ9
 Pk9okmRHo7XPkTdg/OR64FecIMevuMCM7NAiJb1BomF3rYixUe5ibGbmL2bWjdNQscDn
 HLkMY2HmH5kivXKxSq9i0TQwYYK6gSmG04SiKQeOfwJ9oJd/kUUCH8xtXoMF8Ahs8ufd
 u9yKsIkIXDIPtT9Mf24nFcCO4GdDkwp+BO6Cs5W/aRaEHtVN+gl2LFa+HDHxWw4iYVl0
 EVLziT9Pzkt6i13HL+hVueDwvCgVYLlCbDLyCxcEY3S12SB9tIf3Jg8OZIGdhFW7p/b7
 XQqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHpxMG2DJwvLyqvO2KlAjV0h2RO3oZTggBvZU/ekYERaS3ueRfbCfsnGdbG5riPGqJ6hYPDE4Zx2Ujxkk=@nongnu.org
X-Gm-Message-State: AOJu0YzG28MbqMBf7sFg9YnpiX2F/jbjLssFzlOMwdc/sZmTO8Z5nkeZ
 p3PArL07pV4QkIVyn3+/iFNqDtG3TzFlWIEjV7moiIKo2JS2EBAoE+F2NjE7K3c=
X-Gm-Gg: ASbGncusO3Xm+GeXuYeCja7ZAVsc1h0s64xc447A8SaJKGeMyZNIop03IjseqGkP8vy
 D7lZda1xIs0d6QLxbgnPRJ2LUW1/DF7f5BImCEICJjE0gAvOFqesPb0Shx8dJGhAyh2oWWliV4X
 aKQq0ecwmEtCPIjlABK8m7lOUM7j85x6PtXRDIfeSqH9Sm3SfAgLyiLcIlEHZBKX7jNQn6Y47n3
 qdJ7vPsSy3jDTXw9gd6RYXyzbpx4lb/34yu9oMONut3hvQkdr2l4ao=
X-Google-Smtp-Source: AGHT+IF/LDFzcugoWtB7jn9yQlkh0Srrk9DanrmiVjtRCSyGt9oqOKYK+4Fhgu7/KJG3gJqxRY61Cw==
X-Received: by 2002:a05:6000:184e:b0:385:f560:7911 with SMTP id
 ffacd0b85a97d-38a872c93e3mr21342952f8f.10.1736853503027; 
 Tue, 14 Jan 2025 03:18:23 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e3834fbsm14388666f8f.26.2025.01.14.03.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 03:18:22 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 827235F89C;
 Tue, 14 Jan 2025 11:18:21 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Weil via <qemu-devel@nongnu.org>
Cc: Bin Meng <bin.meng@windriver.com>,  John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,  Stefan Weil <sw@weilnetz.de>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] scripts/nsis.py: Run dependency check for each DLL file
 only once
In-Reply-To: <20250111215244.1680931-1-sw@weilnetz.de> (Stefan Weil via's
 message of "Sat, 11 Jan 2025 22:52:44 +0100")
References: <20250111215244.1680931-1-sw@weilnetz.de>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Tue, 14 Jan 2025 11:18:21 +0000
Message-ID: <87ed15k5j6.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 14 Jan 2025 11:18:38 -0000

Stefan Weil via <qemu-devel@nongnu.org> writes:

> Each DLL should only be checked once for dependencies, but
> several hundred (781 in my test) unneeded checks were done.
>
> Now the script is significantly faster (16 s in my build).
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Queued to maintainer/jan-2025, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

