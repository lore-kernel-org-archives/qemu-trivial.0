Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sPJ4f-0007nb-B0
	for mharc-qemu-trivial@gnu.org; Thu, 04 Jul 2024 05:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1sPJ4c-0007nA-RL
 for qemu-trivial@nongnu.org; Thu, 04 Jul 2024 05:48:18 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1sPJ4P-000346-KQ
 for qemu-trivial@nongnu.org; Thu, 04 Jul 2024 05:48:18 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52cd80e55efso708145e87.0
 for <qemu-trivial@nongnu.org>; Thu, 04 Jul 2024 02:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720086483; x=1720691283; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eTGtAckJ4OPcEYf3bG6lbqS6cGVXgdLQAk3WTr1SGgw=;
 b=NdSZetiD63igXmtSEIVC6JJc/cAWwLKpU7TsS9NWF7yZvxV3W6KJ72kLeyY1gi3tmT
 GW02Ntx2B5HTbMG7M2rg9qjAV7egfAAF7f2VkrqQVNNzaBIjtlfLGCbuCoI5TPIeIr6J
 tk0Do3vOWvQf66hSpzkKWbsM3d6CW5d1n2dyVdu5EEObUW38RQEDP8w8y4bLoK3z1gSF
 dmYXKGtWeSl6z64XFrHuDUiug3rUNDJKpEMpqIJ5GTPh9DrEb9x27CAjeLOHyGTeOAe4
 T1KCiYKwRgVH8XiDaEq3nR+KEGTrOIjuhmoGAO06kUgl26U5pHBDdKWowM2FNf5W+ZOg
 O8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720086483; x=1720691283;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eTGtAckJ4OPcEYf3bG6lbqS6cGVXgdLQAk3WTr1SGgw=;
 b=odg/15A38HGTRDdi06WkuDkYUnR3oNXQFz6K2TnSwVFbHHJHzecfArinAjQcHCqBfk
 E+nsR3PwrE4lnE5aayaZGnZNbQOcbmbG7sV9Cr61ItD47tGwp9usxHO0cuG/0b3XJFCt
 QSC2V01n18oYlmBfuNG32ItKBUj/GwAY2TMN0y3CnFV1JtUt3xJ5YLvLpSFBF9xj8iqQ
 GbadCFERCeFLcqZcYIO8UuZI1Vv0c9EWNyETYzgSVWgMZuTjoxTBXXpclq983eVC8a7k
 lhQZ5l5we4jAMDyEmvJZQJOULz/lTeG+yS2Wd5Ci/fyzrDNQc78gXXjvYZ6K3k9NWU1Q
 VKjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6Eo5VqGBf1cSz0iZm1BJ0nFd8rYzuY8S4mI9UILfqNun3MKpPvKSBoQiTQ6dQYGsfKtxD55Zy1uGa0+A7Fne5WoqV6ivnnQ==
X-Gm-Message-State: AOJu0YzudMRho9O2G8Or+KMeqZlmH5GJHq+tVVq6tIZK8sx807h0YpCl
 +pIXTo33AQECAR0BmxC5CbQmKpOAm6RTXj8K+K8IG6Bq8ujWtnpD/G2x71nbaLo=
X-Google-Smtp-Source: AGHT+IHHrsxmnvpZAyGJcca6l/ncdPkOXI0cqmZbtEj4hJx2fPkPjCChla7/npTlrlvo8UknmC/x7w==
X-Received: by 2002:a19:6a0d:0:b0:52c:905b:ea5f with SMTP id
 2adb3069b0e04-52ea06c7fc2mr869461e87.63.1720086483236; 
 Thu, 04 Jul 2024 02:48:03 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77af9f46c0sm70223766b.181.2024.07.04.02.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 02:48:02 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 14A7B5F839;
 Thu,  4 Jul 2024 10:48:02 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>,  Laurent Vivier <laurent@vivier.eu>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/4] accel/kvm/kvm-all: Fix superfluous trailing semicolon
In-Reply-To: <20240704084759.1824420-2-zhao1.liu@intel.com> (Zhao Liu's
 message of "Thu, 4 Jul 2024 16:47:56 +0800")
References: <20240704084759.1824420-1-zhao1.liu@intel.com>
 <20240704084759.1824420-2-zhao1.liu@intel.com>
Date: Thu, 04 Jul 2024 10:48:02 +0100
Message-ID: <87cyntpjxp.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=alex.bennee@linaro.org; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 04 Jul 2024 09:48:19 -0000

Zhao Liu <zhao1.liu@intel.com> writes:

> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>  accel/kvm/kvm-all.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 2b4ab896794b..64bf47a03300 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -3878,7 +3878,7 @@ static StatsList *add_kvmstat_entry(struct kvm_stat=
s_desc *pdesc,
>      /* Alloc and populate data list */
>      stats =3D g_new0(Stats, 1);
>      stats->name =3D g_strdup(pdesc->name);
> -    stats->value =3D g_new0(StatsValue, 1);;
> +    stats->value =3D g_new0(StatsValue, 1);
>=20=20
>      if ((pdesc->flags & KVM_STATS_UNIT_MASK) =3D=3D KVM_STATS_UNIT_BOOLE=
AN) {
>          stats->value->u.boolean =3D *stats_data;

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

