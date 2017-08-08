Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1df6AL-0005St-Kw
	for mharc-qemu-trivial@gnu.org; Tue, 08 Aug 2017 11:11:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1df6AJ-0005Qy-Fy
	for qemu-trivial@nongnu.org; Tue, 08 Aug 2017 11:11:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1df6AG-0005mO-9v
	for qemu-trivial@nongnu.org; Tue, 08 Aug 2017 11:11:27 -0400
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229]:33141)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1df6AG-0005lY-19
	for qemu-trivial@nongnu.org; Tue, 08 Aug 2017 11:11:24 -0400
Received: by mail-wm0-x229.google.com with SMTP id k20so7186964wmg.0
	for <qemu-trivial@nongnu.org>; Tue, 08 Aug 2017 08:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=TxYm+jfUHSakGT0pCctp2sv6+B4Ll+FMEXimu9wfH6w=;
	b=DodNWuE91AEpuLuSw81Z5/bVLfi9o11/n3Zx9ybTdRlCdnNaC3aJCsJsmydhYvheoQ
	v+hVNymgNd3gGMvfpODH2GEtSXXugJJX3+AeLxwpjfeAnBUcHc1ebWXKrbbBzhlh2dwr
	6Iufosmx8seWHSOPekqQqY9iHnbCgNaOooHeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=TxYm+jfUHSakGT0pCctp2sv6+B4Ll+FMEXimu9wfH6w=;
	b=TsfKs5sPf2njOgwGp/0cG1qjY/0Lwj7qGe4px52Wins+jwTqtUNL3YtYvpnnExEX8y
	PB2hZhVUw7sKV3p56/RbAGc2urStIUK3uv05R8/kappdw15ZLnn0PDA47OaHRweUCNLf
	XoVvU9NVJ6/XD8Bovn96AtXHer/Q/abHcCzrNvfvJO2hRKNg+Jkl8HnlfBZQx6N9OgSv
	DBcURxSdcly5rtGtpC1IbrtA+inmy/XpL6pGZ/d7/tLWoxepSx3tE0lI0f0ZtU7IvQN+
	n/n7hDc0elB8YRhJ+Bv2yHABUjYnV5joO5rUk4NFWV21vPbIf+QOLrQY5B/HkwgnieNQ
	RRLw==
X-Gm-Message-State: AHYfb5jJe60KCiNtT7pXiA+5Gqa61MVYGvnCtXHLZEw0QsCuyqv5Qs4X
	TbllyfquDc0DE2U1
X-Received: by 10.28.67.68 with SMTP id q65mr2992866wma.159.1502205082288;
	Tue, 08 Aug 2017 08:11:22 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	h192sm1951488wmd.15.2017.08.08.08.11.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Aug 2017 08:11:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id BC6B33E0127;
	Tue,  8 Aug 2017 16:11:20 +0100 (BST)
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-19-f4bug@amsat.org>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Richard Henderson <rth@twiddle.net>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
In-reply-to: <20170728053610.15770-19-f4bug@amsat.org>
Date: Tue, 08 Aug 2017 16:11:20 +0100
Message-ID: <87mv7aumav.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::229
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 18/47] MAINTAINERS: add
 missing TCG entry
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
X-List-Received-Date: Tue, 08 Aug 2017 15:11:28 -0000


Philippe Mathieu-Daudé <f4bug@amsat.org> writes:

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8cb94af6c5..6b83dac812 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1633,6 +1633,7 @@ Common code
>  M: Richard Henderson <rth@twiddle.net>
>  S: Maintained
>  F: tcg/
> +F: disas.c

Is this really TCG only? Can't the monitor call monitor_disas in any
mode?

>
>  AArch64 target
>  M: Claudio Fontana <claudio.fontana@huawei.com>


--
Alex Bennée

