Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WZrOG-0005cf-Qq
	for mharc-qemu-trivial@gnu.org; Mon, 14 Apr 2014 20:38:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WZrO6-0005br-Ca
	for qemu-trivial@nongnu.org; Mon, 14 Apr 2014 20:38:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WZrNv-0003HO-2q
	for qemu-trivial@nongnu.org; Mon, 14 Apr 2014 20:38:10 -0400
Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235]:59786)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1WZrNu-0003H8-RX; Mon, 14 Apr 2014 20:37:59 -0400
Received: by mail-pd0-f181.google.com with SMTP id p10so8686509pdj.40
	for <multiple recipients>; Mon, 14 Apr 2014 17:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=OsehsEbOdbgFRqc2M1TnLyjsBXMD0f2cKRC70a965H8=;
	b=eFEpUFXz/EfPPknq+yvWiYBEpqmURAvPPPohZJuwstbX5VAOjiOewfD2Xxbug7+Xk0
	1js3zKKX7KGc/PSHkczzOebEl93+EVuOvCUyGZ593DXgkoczZxZfakG/tqzzuiw0M3RX
	IfjvPKs4CxUZ6nlEGujiRSvu6b3Tr9PmRgL5HZFsc7dSMKPqkF2zXhA/9v3TlmlVA9O5
	VizrKyGmzH5YHioegA/xsrWWskClNV+3y/K3QzqZ70mSEFRoGvMKjAQ/Dl+ZJwhe0f77
	i8oPcpPDCo69E081lghKTyFYhBcKn9ElaCTqv3DpT+sh3cKes5BcAyT4NNpQJk/ct5gc
	V5lQ==
X-Received: by 10.68.171.229 with SMTP id ax5mr6832162pbc.125.1397522276691;
	Mon, 14 Apr 2014 17:37:56 -0700 (PDT)
Received: from [192.168.1.104] ([124.126.234.202])
	by mx.google.com with ESMTPSA id
	db3sm36440099pbb.10.2014.04.14.17.37.51 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Apr 2014 17:37:55 -0700 (PDT)
Message-ID: <534C7F5C.7010805@gmail.com>
Date: Tue, 15 Apr 2014 08:37:48 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <53337BEB.90305@gmail.com> <87wqfgrp83.fsf@blackfin.pond.sub.org>
	<5333F6E2.9080202@gmail.com> <53382DDD.8050001@gmail.com>
	<87fvlylf02.fsf@blackfin.pond.sub.org> <53396545.805@gmail.com>
	<CAFEAcA-GL7bnZ-Pkga9PzDq7DpwPf8Gx0Wezzkm_CCbSUB1W8A@mail.gmail.com>
	<533969AB.4010505@gmail.com>
	<CAFEAcA_w=35e9dVL_Zo84MoxZqCUH9qJ76v=Pn=XQ0FZq8g_-g@mail.gmail.com>
	<53396CE9.9090405@gmail.com>
	<CAFEAcA9dk3991gc+FK0qp9QwhWkjxO0vK=X1TxS37Y1sXD5RNw@mail.gmail.com>
	<533E7DD5.3090203@gmail.com> <5340F4FD.7040305@msgid.tls.msk.ru>
	<53414941.5040908@gmail.com> <5343E4D4.6070305@gmail.com>
In-Reply-To: <5343E4D4.6070305@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::235
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH trivial 0/3] vl: simplify code for main()
	and get_boot_device()
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
X-List-Received-Date: Tue, 15 Apr 2014 00:38:19 -0000


May any member help to check them?

And next, I shall try to find bug issues (not code style or document
issues), and fix them. Hope I can succeed.

Thanks.

On 04/08/2014 08:00 PM, Chen Gang wrote:
> In "vl.c", at least, we can simplify the code below, so can let readers
> read professional C code (especially for new readers, which often start
> reading code at main function).
> 
>  - remove useless 'continue' in main().
> 
>  - remove redundant local variable 'res' in get_boot_device().
> 
>  - remove local variable 'args' in the middle of code block in main().
> 
> The following 3 patches are for the 3 'remove' above.
> 
> And "vl.c" has a very long function main() which is about 17K lines.
> Next, it can be split into sub-functions (so can bypass another code
> style issue: multiple "{...}" styles within "swith(...)").
> 
> 
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  vl.c |   23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
> 

-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

