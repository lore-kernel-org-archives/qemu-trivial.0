Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMdS4-0001rh-CI
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 10:44:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ZMdRz-0001kG-Sa
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 10:44:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ZMdRu-0007p0-Ty
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 10:44:19 -0400
Received: from mail-qk0-x233.google.com ([2607:f8b0:400d:c09::233]:33950)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1ZMdRu-0007or-PE; Tue, 04 Aug 2015 10:44:14 -0400
Received: by qkfc129 with SMTP id c129so3982134qkf.1;
	Tue, 04 Aug 2015 07:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=+KmQ1Ejo6YEHpswKVFxcXOr5S9JkBbnSduMVfdnF4z8=;
	b=capzq9rx9orGM40thzm7MUbwNJCOlIQR4dggZPGfXvwObvaPFWv8DxQOcwv/97CjUz
	np2gNK/cCOIM4F7q2eAHbfo/krdOKFel3CNBLx614Kq8cgx6ek9+ItkcpjVHUvrHCWSW
	tf1pCY00j5WG7Qe0havSki+fgClKwHIGUrJExUT6eXx5eurLKtfUlgF+xGxYVM2wiSyN
	zQUqp7oyiTtiDm4jTV33pklSnUiC+CEpXCxgIMurxVCe2h9TubJswPzYNkskkFmrdui6
	g5Wz0mL1ZYcJZ94Dno+HebMls1awDkdXzwaMkUNR/E7ZutF7ESiT8l0Y45AOVcXDlSbR
	+a4A==
X-Received: by 10.55.18.219 with SMTP id 88mr7227932qks.100.1438699454316;
	Tue, 04 Aug 2015 07:44:14 -0700 (PDT)
Received: from anchor.twiddle.net
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by smtp.googlemail.com with ESMTPSA id
	f204sm567470qhc.35.2015.08.04.07.44.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Aug 2015 07:44:13 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-10-git-send-email-alex.bennee@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <55C0CFB9.3090105@twiddle.net>
Date: Tue, 4 Aug 2015 07:44:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1438593291-27109-10-git-send-email-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c09::233
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, crosthwaitepeter@gmail.com,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH v4 09/11] target-arm: dfilter support for
 in_asm, op, opt_op
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Aug 2015 14:44:21 -0000

On 08/03/2015 02:14 AM, Alex Bennée wrote:
> Each individual architecture needs to use the qemu_log_in_addr_range()
> feature for enabling in_asm and marking blocks for op/opt_op output.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target-arm/translate-a64.c | 6 ++++--
>  target-arm/translate.c     | 6 ++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
> index 689f2be..0b0f4ae 100644
> --- a/target-arm/translate-a64.c
> +++ b/target-arm/translate-a64.c
> @@ -11026,7 +11026,8 @@ void gen_intermediate_code_internal_a64(ARMCPU *cpu,
>              gen_io_start();
>          }
>  
> -        if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP | CPU_LOG_TB_OP_OPT))) {
> +        if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP | CPU_LOG_TB_OP_OPT) &&
> +                     qemu_log_in_addr_range(dc->pc))) {
>              tcg_gen_debug_insn_start(dc->pc);
>          }

If there's more than one or two ranges, it's probably quicker to
generate the debug opcode regardless of the range.  Remember, this
check is happening once per insn, not once per tb.


r~

