Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eKQqH-0005gW-J5
	for mharc-qemu-trivial@gnu.org; Thu, 30 Nov 2017 10:33:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eKQq9-0005a2-6d
	for qemu-trivial@nongnu.org; Thu, 30 Nov 2017 10:33:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eKQq5-0007lU-3H
	for qemu-trivial@nongnu.org; Thu, 30 Nov 2017 10:33:29 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33078)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eKQq4-0007lA-VR; Thu, 30 Nov 2017 10:33:25 -0500
Received: by mail-qt0-x242.google.com with SMTP id e2so9216733qti.0;
	Thu, 30 Nov 2017 07:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=2itC2+VNoCJdcST61v7v1N5jNRcTJtL/zF21R3IX0VE=;
	b=WVIcLqV3sOHgM9rl4t+4zndcdWIDEOg12KknfHoJssXXhp4fWLMKA2ybz7ilrp1rrI
	h51WDFsHVCxgtSzycsRsa/zcI+rzjMTMw+GvLwldxpHjsFadBBMbbZfcn+q1GBrMK3nL
	wAsJqpTgFcRsJdu8CG81kUvXcVClcSld6Y0h/1Twxoro3lJocd/QzQnr369uOALWlDCG
	7RiwDyw23dDeaKfZOMXclMfHiH+VE8wWCAB4NpQtvIM3tHJCikEYNRCCxIOhaNtL4hj5
	Z7EGD2uobfZmbuOn/FNEA6ynmw1C6sY3AUK7CZOiSGk9KFNO7CTaVU22FDG8MPUfyk85
	O11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=2itC2+VNoCJdcST61v7v1N5jNRcTJtL/zF21R3IX0VE=;
	b=Meo68yzhrTiW0v8LDFvfU/sDZ4UEebiAFDf8K8JCZck5rGrVl8L6lU7kg5iAdamjA2
	s0g28/dXau+mmNjToqMG/hf/SV4rnveDgi58fx0OhS96+LZpcDtTxwlb20spYMv/vTPy
	utZAedJgfAs9PUBpnhIaK0wcePihYjoxGc7f/b93zUPJarmWsXo2dqZiBsbJxVWpjliv
	nCocmYfsc7qzXRSmmdo2I9YTQrj9FLoaw9jItWFMA9Oe+RmulEaZQ88F/8wL1XRzBYYt
	7iS0mi5Cld7dPMWIKPZweIA+TbeBE7zf11RYSpXcsFJ43f/NrH8EqaVIx5WMYgjeikUh
	hgeg==
X-Gm-Message-State: AKGB3mIl/FE+25B+ghsMe00j2re6z3ZfZaj4eeocrgSA0ziOhIpNZxYo
	rq7LSPq5L6RjfoXHGv6mtE8=
X-Google-Smtp-Source: AGs4zMadcmxbI665SO/Mut6uDasfY/hbXF20NOWIkVLt+W4IB4fAvLX1GU69QwryHMWy7fR5dOOqaA==
X-Received: by 10.237.54.138 with SMTP id f10mr3785852qtb.261.1512056004036;
	Thu, 30 Nov 2017 07:33:24 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.211])
	by smtp.gmail.com with ESMTPSA id
	m22sm3088451qtf.85.2017.11.30.07.33.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Nov 2017 07:33:23 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Yongbok Kim <yongbok.kim@mips.com>,
	Aurelien Jarno <aurelien@aurel32.net>
References: <20171130134159.9697-1-eblake@redhat.com>
	<20171130134159.9697-3-eblake@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <253dc231-89f2-fc09-0158-9906da51d9d6@amsat.org>
Date: Thu, 30 Nov 2017 12:33:19 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171130134159.9697-3-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/3] mips: Tweak location of
 '; ' in macros
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Nov 2017 15:33:35 -0000

On 11/30/2017 10:41 AM, Eric Blake wrote:
> It is more typical to provide the ';' by the caller of a macro
> than to embed it in the macro itself; this is because syntax
> highlight engines can get confused if a macro is called without
> a semicolon before the closing '}'.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/mips/msa_helper.c | 34 ++++++++++++++++++----------------
>  1 file changed, 18 insertions(+), 16 deletions(-)
> 
> diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
> index f167a42655..8fb7a369ca 100644
> --- a/target/mips/msa_helper.c
> +++ b/target/mips/msa_helper.c
> @@ -682,13 +682,13 @@ static inline int64_t msa_mod_u_df(uint32_t df, int64_t arg1, int64_t arg2)
>      do {                                \
>          e = SIGNED_EVEN(a, df);         \
>          o = SIGNED_ODD(a, df);          \
> -    } while (0);
> +    } while (0)
> 
>  #define UNSIGNED_EXTRACT(e, o, a, df)   \
>      do {                                \
>          e = UNSIGNED_EVEN(a, df);       \
>          o = UNSIGNED_ODD(a, df);        \
> -    } while (0);
> +    } while (0)
> 
>  static inline int64_t msa_dotp_s_df(uint32_t df, int64_t arg1, int64_t arg2)
>  {
> @@ -1120,9 +1120,11 @@ void helper_msa_splat_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
>  #define MSA_LOOP_COND_D MSA_LOOP_COND(DF_DOUBLE)
> 
>  #define MSA_LOOP(DF) \
> +    do { \
>          for (i = 0; i < (MSA_LOOP_COND_ ## DF) ; i++) { \
> -            MSA_DO_ ## DF \
> -        }
> +            MSA_DO_ ## DF; \
> +        } \
> +    } while (0)
> 
>  #define MSA_FN_DF(FUNC)                                             \
>  void helper_msa_##FUNC(CPUMIPSState *env, uint32_t df, uint32_t wd, \
> @@ -1135,17 +1137,17 @@ void helper_msa_##FUNC(CPUMIPSState *env, uint32_t df, uint32_t wd, \
>      uint32_t i;                                                     \
>      switch (df) {                                                   \
>      case DF_BYTE:                                                   \
> -        MSA_LOOP_B                                                  \
> +        MSA_LOOP_B;                                                 \
>          break;                                                      \
>      case DF_HALF:                                                   \
> -        MSA_LOOP_H                                                  \
> +        MSA_LOOP_H;                                                 \
>          break;                                                      \
>      case DF_WORD:                                                   \
> -        MSA_LOOP_W                                                  \
> +        MSA_LOOP_W;                                                 \
>          break;                                                      \
>      case DF_DOUBLE:                                                 \
> -        MSA_LOOP_D                                                  \
> -       break;                                                       \
> +        MSA_LOOP_D;                                                 \
> +        break;                                                      \
>      default:                                                        \
>          assert(0);                                                  \
>      }                                                               \
> @@ -1168,7 +1170,7 @@ void helper_msa_##FUNC(CPUMIPSState *env, uint32_t df, uint32_t wd, \
>      do {                                \
>          R##DF(pwx, i) = pwt->DF[2*i];   \
>          L##DF(pwx, i) = pws->DF[2*i];   \
> -    } while (0);
> +    } while (0)
>  MSA_FN_DF(pckev_df)
>  #undef MSA_DO
> 
> @@ -1176,7 +1178,7 @@ MSA_FN_DF(pckev_df)
>      do {                                \
>          R##DF(pwx, i) = pwt->DF[2*i+1]; \
>          L##DF(pwx, i) = pws->DF[2*i+1]; \
> -    } while (0);
> +    } while (0)
>  MSA_FN_DF(pckod_df)
>  #undef MSA_DO
> 
> @@ -1184,7 +1186,7 @@ MSA_FN_DF(pckod_df)
>      do {                                \
>          pwx->DF[2*i]   = L##DF(pwt, i); \
>          pwx->DF[2*i+1] = L##DF(pws, i); \
> -    } while (0);
> +    } while (0)
>  MSA_FN_DF(ilvl_df)
>  #undef MSA_DO
> 
> @@ -1192,7 +1194,7 @@ MSA_FN_DF(ilvl_df)
>      do {                                \
>          pwx->DF[2*i]   = R##DF(pwt, i); \
>          pwx->DF[2*i+1] = R##DF(pws, i); \
> -    } while (0);
> +    } while (0)
>  MSA_FN_DF(ilvr_df)
>  #undef MSA_DO
> 
> @@ -1200,7 +1202,7 @@ MSA_FN_DF(ilvr_df)
>      do {                                \
>          pwx->DF[2*i]   = pwt->DF[2*i];  \
>          pwx->DF[2*i+1] = pws->DF[2*i];  \
> -    } while (0);
> +    } while (0)
>  MSA_FN_DF(ilvev_df)
>  #undef MSA_DO
> 
> @@ -1208,7 +1210,7 @@ MSA_FN_DF(ilvev_df)
>      do {                                    \
>          pwx->DF[2*i]   = pwt->DF[2*i+1];    \
>          pwx->DF[2*i+1] = pws->DF[2*i+1];    \
> -    } while (0);
> +    } while (0)
>  MSA_FN_DF(ilvod_df)
>  #undef MSA_DO
>  #undef MSA_LOOP_COND
> @@ -1222,7 +1224,7 @@ MSA_FN_DF(ilvod_df)
>          uint32_t k = (pwd->DF[i] & 0x3f) % (2 * n);                         \
>          pwx->DF[i] =                                                        \
>              (pwd->DF[i] & 0xc0) ? 0 : k < n ? pwt->DF[k] : pws->DF[k - n];  \
> -    } while (0);
> +    } while (0)
>  MSA_FN_DF(vshf_df)
>  #undef MSA_DO
>  #undef MSA_LOOP_COND
> 

