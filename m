Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uWt6G-0006Hy-4Y
	for mharc-qemu-trivial@gnu.org; Wed, 02 Jul 2025 04:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uWt6A-0006HC-Sw
 for qemu-trivial@nongnu.org; Wed, 02 Jul 2025 04:45:48 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uWt68-0001o4-Sv
 for qemu-trivial@nongnu.org; Wed, 02 Jul 2025 04:45:46 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ae0de0c03e9so981529066b.2
 for <qemu-trivial@nongnu.org>; Wed, 02 Jul 2025 01:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751445940; x=1752050740; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EkPC+xflEyh58hMWVG+t45AJTZEdXM5JQ6CwJJJFexs=;
 b=j+aKBDK3bnCMm7K7A0QRZmS1GyuI51/QhS5v6fjgihQlkCShJe7PODTRLf7IvyK9Pf
 R6QyJSIv3WpxhUe6rbnigMsSIfByTKdHPK/IBWFKVpqUA+K5R26zc5mZYrrUT4VcYy28
 cGB5y9DCfMDnLmKl+Mba0qrqMnZ3+vPcO6kqYky+NaKvcVFu8FTGtREMe7XxNU/vbUhd
 qDEp3SVNh8xd+7u0ygvjZ6RHsRDHX8CaMJVGDCtIFwX0GMC9MS+ZG1PBSN5uiY/PnD5R
 gqZ32VSzoiL2EYD2rTi9D8NwfmaY+G8N+yegwnoDf1bunyiRSJqx3eHkZ01GC7oN1FVB
 mnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751445940; x=1752050740;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EkPC+xflEyh58hMWVG+t45AJTZEdXM5JQ6CwJJJFexs=;
 b=amg8iCKTCtUVUjy7wR1qK/lKhtxtiHBano12MvnNuWwRKVlJwTwvKsXJkpDC3isNDd
 +HVFlVP4QFY5CNR6EKUF9zjF59J9yJSkjUTy9zIecSSq7RxtV5E9zh/g6wPtstieL027
 pMo5cpyqMbS8cngRj9azy725u8hEp1JslFKHUA5e7j7soA7mfSXZcEyHeMoJIS77sPok
 LBd6t/HalJO9BuHfzi4H3J2ePgiSljn6RPzgjAYbkitUrronGH3OeTqckWZSOI0uldEx
 j4aGIH3VsR2RB4uBHQRM7w9YGkqmHa0BXRALLYu7yXDyQwVnfHhBKNWcZGLsGipMqBGy
 DXnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRu1JlSbymJWCqsHrubMgbZPTBg6prBjJex7wwzYkeUYv8cLOa+bgZgXTEze0RCXvo2Qvz5q9asUmyYEI=@nongnu.org
X-Gm-Message-State: AOJu0Yxp5XgQ11DE5d/H3aHheKMQMHeQBy8DxmE373nhhDR0xE0CScZJ
 62MtWJm5bKDuklBkprcXutpJlkkC9GmkmeuYP8fw7fPEa3dIDq6a/hp+3Y0vuDGgY4PzctY+5wb
 zMVm4sqY=
X-Gm-Gg: ASbGnct+aRTL2J76BE00NN/CQB0c7xUU4LrPvU4cMbA1GiOzKT6FGNurnvzipg0XCfd
 +XPoXwqzuajhQkIp4Ve+qlxXn+CFskpDo+zvJJISKHj2YIDukA77C44vdy6BmZNlHt6Ti45Q+8Q
 LNqI08ugA1W8zWICyEiaEuWOmPznefVuNAtI7lTHxwJBIK8rrGkrFqD1T6OP7GEiqT03dzPiwoU
 4oea5pqhd3+byNCVkSGD1YzEp1GtL7j9FREstB4H+uFWmlB4Ige9zJvad2RLdxD8beaUQlz+RNk
 aDnfpYpmxgrGKdZ8HUGYgkE2xlXRn+uKhIo4MeMPqdtbcb6fmFyegY/99wExzxY=
X-Google-Smtp-Source: AGHT+IEVxUH7oMwDwObWpMbe8WbFxVuANAWzJhGt2tlc56v71xNu1CVww1/cqC4iApoRpvp9aDXKVQ==
X-Received: by 2002:a17:907:7fa8:b0:ae3:5e27:8e66 with SMTP id
 a640c23a62f3a-ae3c2bdcc36mr207648166b.27.1751445940571; 
 Wed, 02 Jul 2025 01:45:40 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60c828e1a96sm8672319a12.19.2025.07.02.01.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 01:45:39 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id F0A225F8BE;
 Wed, 02 Jul 2025 09:45:38 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  qemu-devel@nongnu.org,  Zhao Liu
 <zhao1.liu@intel.com>,  qemu-trivial@nongnu.org
Subject: Re: [PATCH] docs/system/target-i386: Remove the sentence about RHEL
 7 being supported
In-Reply-To: <20250702082138.23109-1-thuth@redhat.com> (Thomas Huth's message
 of "Wed, 2 Jul 2025 10:21:38 +0200")
References: <20250702082138.23109-1-thuth@redhat.com>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Wed, 02 Jul 2025 09:45:38 +0100
Message-ID: <877c0rf0b1.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
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
X-List-Received-Date: Wed, 02 Jul 2025 08:45:50 -0000

Thomas Huth <thuth@redhat.com> writes:

> From: Thomas Huth <thuth@redhat.com>
>
> According to our "Supported build platforms" policy, RHEL 7 is not
> supported anymore, so let's remove the related sentence from the x86
> documentation.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

