Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRQc3-0000Sr-M3
	for mharc-qemu-trivial@gnu.org; Tue, 19 Dec 2017 17:43:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37015)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eRQc0-0000QJ-UF
	for qemu-trivial@nongnu.org; Tue, 19 Dec 2017 17:43:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eRQbz-0000Jd-Ro
	for qemu-trivial@nongnu.org; Tue, 19 Dec 2017 17:43:48 -0500
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:35556)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eRQbx-0000Fs-56; Tue, 19 Dec 2017 17:43:45 -0500
Received: by mail-wr0-x243.google.com with SMTP id l19so8324518wrc.2;
	Tue, 19 Dec 2017 14:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=/Ez8j/02OJcn8Dl+/ncVKgDijnY8hePNLRl2nKIrd+U=;
	b=utfjjfvfl3KIs/fUhD3Idv81gxz1xLsxve8MerGdmX/IJf/WWJuSnhbqnkiwqvsnlf
	19hyoFUithGPbiVnKWaoLNVxyvtvH5PjkpW8ErCVXeqwg95qxwlxFzrqX5ANXstDV8o4
	4OgY9a5MCtkWroTSXY1y05iTAPyFzQpAnsziVml9xYOkK76yustQARNU+Vv8NRRtp1li
	94yKQRjOy3/r47QKkbSfv3/937uwFQbPZM2sXS3FGXo8V+hagb4x7OOUmQuHFxS3rMH0
	leZrWV96u638vLOWgqlanjyuc8AmiOjnvDxA6fD7dYixvTFHiFLoWGfMdIf427f/+kb7
	/uvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=/Ez8j/02OJcn8Dl+/ncVKgDijnY8hePNLRl2nKIrd+U=;
	b=GWrWIPBa4h7p9l3gfa9Y5ffLlRaOWCGzCTrY8kFRkaaKoy8aVuMXwNTh/K0FprNrZ/
	DkkQpkHMS38l0RqQOFR+iQo5bdIOKM3e9i4iObPQyEasHnqtmvrzFIu5TsrI2xSga6q9
	aH1L43Ib7nsshrvOzyMHRI4IcUwT0HByA7AWOMJ3BzBrVUVdl1cK8ft4K+sAd7l9upo6
	EpTRtZ97od4zRCwbXonPCTIH64fzyQWGX6cwSCTcbea01S7tDDjHeV7gVFCvR1a9bOKJ
	Nz4pqjadLD2o4nUR3i25zrcS561236RBtS9oMqEr6tzvyNmZ0KiIsYeMnuHEsX/Llzi2
	4n+A==
X-Gm-Message-State: AKGB3mJmDyVQmmEzXxsytrnvjobLZEpjyr7FFQqBkaDKmd33KabsPL74
	9NBiKYlfmmX7kRtmn49+Jt5qdknUngohTiQkoiw=
X-Google-Smtp-Source: ACJfBotfCmdiU2UVcJAugLbdUma5knZ/w/XRFxSuKgj5vzSXlpxHCy4J0mhfG0Fi/iSnxT5aY/bwv+bKEIUPog4lwhA=
X-Received: by 10.223.171.79 with SMTP id r15mr5925536wrc.219.1513723423924;
	Tue, 19 Dec 2017 14:43:43 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.28.164.69 with HTTP; Tue, 19 Dec 2017 14:43:13 -0800 (PST)
In-Reply-To: <7a185bec-43b3-7fcd-d419-9af143b2e3f9@redhat.com>
References: <cover.1510612380.git.alistair.francis@xilinx.com>
	<d297d74fd53f91e25e4ffb980ea40d4032beaf0b.1510612380.git.alistair.francis@xilinx.com>
	<7a185bec-43b3-7fcd-d419-9af143b2e3f9@redhat.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 19 Dec 2017 14:43:13 -0800
X-Google-Sender-Auth: ymyq2Rk0KgeSq4nMlWrZlvDLUws
Message-ID: <CAKmqyKPBQV6hGptPW3g4rFe=NShkOmTenteDCei0Jv=e_aunsw@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Alistair Francis <alistair.francis@xilinx.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Markus Armbruster <armbru@redhat.com>,
	"open list:New World" <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 29/29] target: Use
 qemu_log() instead of fprintf(stderr, ...)
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
X-List-Received-Date: Tue, 19 Dec 2017 22:43:50 -0000

On Mon, Nov 13, 2017 at 11:40 PM, Thomas Huth <thuth@redhat.com> wrote:
> On 13.11.2017 23:36, Alistair Francis wrote:
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> [...]
>> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
>> index 998fbed848..8eafe30624 100644
>> --- a/target/ppc/translate.c
>> +++ b/target/ppc/translate.c
>> @@ -3945,11 +3945,11 @@ static inline void gen_op_mfspr(DisasContext *ctx)
>>               * allowing userland application to read the PVR
>>               */
>>              if (sprn != SPR_PVR) {
>> -                fprintf(stderr, "Trying to read privileged spr %d (0x%03x) at "
>> -                        TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
>> +                qemu_log("Trying to read privileged spr %d (0x%03x) at "
>> +                         TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
>>                  if (qemu_log_separate()) {
>>                      qemu_log("Trying to read privileged spr %d (0x%03x) at "
>> -                             TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
>> +                              TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
>
> Unnecessary and wrong white space change. Please fix that line.
>
>>                  }
>>              }
>>              gen_priv_exception(ctx, POWERPC_EXCP_PRIV_REG);
>> @@ -3962,8 +3962,8 @@ static inline void gen_op_mfspr(DisasContext *ctx)
>>              return;
>>          }
>>          /* Not defined */
>> -        fprintf(stderr, "Trying to read invalid spr %d (0x%03x) at "
>> -                TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
>> +        qemu_log("Trying to read invalid spr %d (0x%03x) at "
>> +                 TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
>>          if (qemu_log_separate()) {
>>              qemu_log("Trying to read invalid spr %d (0x%03x) at "
>>                       TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
>
> Now that looks wrong, too: If qemu_log_separate() returns true, the same
> message is printed out again?
>
>> @@ -4108,8 +4108,8 @@ static void gen_mtspr(DisasContext *ctx)
>>              (*write_cb)(ctx, sprn, rS(ctx->opcode));
>>          } else {
>>              /* Privilege exception */
>> -            fprintf(stderr, "Trying to write privileged spr %d (0x%03x) at "
>> -                    TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
>> +            qemu_log("Trying to write privileged spr %d (0x%03x) at "
>> +                     TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
>>              if (qemu_log_separate()) {
>>                  qemu_log("Trying to write privileged spr %d (0x%03x) at "
>>                           TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
>
> dito
>
>> @@ -4129,8 +4129,8 @@ static void gen_mtspr(DisasContext *ctx)
>>              qemu_log("Trying to write invalid spr %d (0x%03x) at "
>>                       TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
>>          }
>> -        fprintf(stderr, "Trying to write invalid spr %d (0x%03x) at "
>> -                TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
>> +        qemu_log("Trying to write invalid spr %d (0x%03x) at "
>> +                 TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
>
> dito
>
>> diff --git a/target/sh4/translate.c b/target/sh4/translate.c
>> index 703020fe87..32b72b4701 100644
>> --- a/target/sh4/translate.c
>> +++ b/target/sh4/translate.c
>> @@ -427,7 +427,7 @@ static void _decode_opc(DisasContext * ctx)
>>       }
>>
>>  #if 0
>> -    fprintf(stderr, "Translating opcode 0x%04x\n", ctx->opcode);
>> +    qemu_log("Translating opcode 0x%04x\n", ctx->opcode);
>
> That looks like a debug statement for the develepers ... why should that
> be a qemu_log() ?
>
>>  #endif
>>
>>      switch (ctx->opcode) {
>> @@ -1788,7 +1788,7 @@ static void _decode_opc(DisasContext * ctx)
>>          break;
>>      }
>>  #if 0
>> -    fprintf(stderr, "unknown instruction 0x%04x at pc 0x%08x\n",
>> +    qemu_log_mask(LOG_UNIMP, "unknown instruction 0x%04x at pc 0x%08x\n",
>>           ctx->opcode, ctx->pc);
>
> Since this is now only logged conditionally if UNIMP logging is enabled,
> I think you should remove the "#if 0" in front of it now.
>
>>      fflush(stderr);
>
> Since you don't print to stderr anymore, this fflush() also does not
> make sense anymore.

Ok, fixed all of these.

Alistair

>
>>  #endif
>
>  Thomas

