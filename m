Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYZoC-0008BI-Ux
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jul 2017 11:25:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dYZoB-0008A1-L1
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 11:25:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dYZo7-0000MB-IM
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 11:25:36 -0400
Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229]:34330)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dYZo7-0000Lg-Bw
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 11:25:35 -0400
Received: by mail-wr0-x229.google.com with SMTP id 12so83883656wrb.1
	for <qemu-trivial@nongnu.org>; Fri, 21 Jul 2017 08:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3N2Ct0Mg+Xu5skxwf/It+XQJVLZNIPHkR52NURU9Nws=;
	b=GBKeeMl/2bSwV29EE3xXN/GqO8z32VKWDUgQsUHwk1lLMLtQ8oMREDXmknBjvqw0uL
	AgoxqI5m3AN2lEzEFkl6a/GR3Gn/rQmWrd5DLonTpHU1BiqkiCXJUpxagJOc0KaJfVu/
	L0G8utn0derRzNacH0HasN1rdHk1duZfEvNHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3N2Ct0Mg+Xu5skxwf/It+XQJVLZNIPHkR52NURU9Nws=;
	b=XrVtxbw8QO87GmsIQ2kZ3DmQWSGqqhSBDK4DHzNr0qCgdgI28Avse0LNPmX1ROIK3r
	Huxo1stfeu84vLrjCqtl4J5h9Qz0cViycI7t693zB8EFhjb+drixNNqt5neIEmmd9plq
	28ENgt7WmWgNtSMaVbpqMKoazHKuIHteO60U3Ic2I9pC3VC5dTAEpq3wC+y/+sJeck5k
	10OTBuFkhObr+XW7MiGoUBG+2M5liHhVokGBSHcfeFaEwH4WLxvzQk506brfpkUnwUW2
	nraIwKhITez+pDt5lOjtPh2JPXjVJBzh6/Ng4EVmMjp/SYURinKLkxLQJQjXRFdU95h/
	fOOQ==
X-Gm-Message-State: AIVw112QsAoNhdkjVT+tKnNuBaDDc9LYlGHccQnf9dqZi/ptNpQPUNUp
	hQ9KlQ71CwVV+XApifLPfdm6bx344MIb
X-Received: by 10.223.163.16 with SMTP id c16mr10969586wrb.173.1500650732097; 
	Fri, 21 Jul 2017 08:25:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Fri, 21 Jul 2017 08:25:11 -0700 (PDT)
In-Reply-To: <5de01cad-5a63-ff42-8c6f-25210aa8348d@redhat.com>
References: <1500395194-21455-1-git-send-email-peter.maydell@linaro.org>
	<1500395194-21455-4-git-send-email-peter.maydell@linaro.org>
	<5de01cad-5a63-ff42-8c6f-25210aa8348d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Jul 2017 16:25:11 +0100
Message-ID: <CAFEAcA8nk2W2EBVyD16n1c8F3TZMb-7FBJ9HVuX86A+KyxtuYA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>,
	Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::229
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.10 3/4]
 bsd-user/bsdload.c: Remove write-only id_change variable
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
X-List-Received-Date: Fri, 21 Jul 2017 15:25:40 -0000

On 21 July 2017 at 12:12, Thomas Huth <thuth@redhat.com> wrote:
> On 18.07.2017 18:26, Peter Maydell wrote:
>> On OpenBSD the compiler complains:
>> bsd-user/bsdload.c:54:17: warning: variable 'id_change' set but not used [-Wunused-but-set-variable]
>>
>> This is dead code that was originally copied from linux-user.
>> We fixed this in linux-user in commit 331c23b5ca44293d1 in 2011;
>> delete the useless code from bsd-user too.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---

>
> Matches the commit from linux-user, and looks sane to me, so:
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Thanks; applied to master.

-- PMM

