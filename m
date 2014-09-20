Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XVE6c-0006UX-5E
	for mharc-qemu-trivial@gnu.org; Sat, 20 Sep 2014 02:25:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1XVE6Q-00069Q-NI
	for qemu-trivial@nongnu.org; Sat, 20 Sep 2014 02:25:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1XVE6H-0002vh-Ns
	for qemu-trivial@nongnu.org; Sat, 20 Sep 2014 02:25:02 -0400
Received: from mail-we0-x235.google.com ([2a00:1450:400c:c03::235]:49273)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1XVE5z-0002tb-EY; Sat, 20 Sep 2014 02:24:35 -0400
Received: by mail-we0-f181.google.com with SMTP id q59so659287wes.40
	for <multiple recipients>; Fri, 19 Sep 2014 23:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Ex5NDa/hEhs+Ynr/hX2oiYvpoANRuYv7f2Bo2YojP7I=;
	b=iiCgxEhDM+kVdv9dJMVMxHWjshnfszl/JvXWQQSjsdEhtHKvPTBk0F4AVZQxmQC2u8
	KdAf84prVvzb4KjvpNThptWXqrtXkhbim7NF8VdKNaTBE40xZZWOwbUyDQ5CKsxSrsdx
	Pi8FqmmBFyZm4BWkzJTzsSf5ySe9ph+b0nm0tY9B46k4WnSPLpq60kIWt7BOuMmuln6f
	K7hhpN3f0q6gCOur6C/gCD0D8jLJCxEnN9nvYDgHnYuJ941pTT6T+net4oIJloAE0GG7
	qGbo00JLyggrQWmdGe1wfnr+7H4FDO40x0DVbPc5jvhPM8R+Y0Q32vlQOuSk8l49Hrjw
	ahOg==
X-Received: by 10.194.58.108 with SMTP id p12mr5911331wjq.71.1411194269547;
	Fri, 19 Sep 2014 23:24:29 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-116-212-135.cust.vodafonedsl.it. [37.116.212.135])
	by mx.google.com with ESMTPSA id mx19sm4326104wic.3.2014.09.19.23.24.26
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Sep 2014 23:24:28 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <541D1D9A.6020100@redhat.com>
Date: Sat, 20 Sep 2014 08:24:26 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Amos Kong <akong@redhat.com>, qemu-trivial@nongnu.org
References: <1411171901-13792-1-git-send-email-akong@redhat.com>
In-Reply-To: <1411171901-13792-1-git-send-email-akong@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::235
Cc: qemu-devel@nongnu.org, afaerber@suse.de, jen@redhat.com,
	aliguori@amazon.com
Subject: Re: [Qemu-trivial] [PATCH] qom: suppress conscan warning of
	returning null point
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
X-List-Received-Date: Sat, 20 Sep 2014 06:25:12 -0000

Il 20/09/2014 02:11, Amos Kong ha scritto:
> Conscan complains about g_malloc0() and malloc() return null.
> 
>   Error: NULL_RETURNS (CWE-476):
>   qemu-kvm/qom/object.c:239: returned_null: Function "g_malloc0(gsize)" returns null.
>   qemu-kvm/qom/object.c:239: var_assigned: Assigning: "ti->class" = null return value from "g_malloc0(gsize)".
>   qemu-kvm/qom/object.c:249: dereference: Dereferencing a null pointer "ti->class".
> 
> But if the passed size parameter is >= 1, then we can always get an
> effective pointer, the warning disappears.

The model should handle it:

void *
g_malloc0(size_t n_bytes)
{
    void *mem;
    __coverity_negative_sink__(n_bytes);
    mem = calloc(1, n_bytes == 0 ? 1 : n_bytes);
    if (!mem) __coverity_panic__();
    return mem;
}

So this patch means your coverity runs are misconfigured.

Paolo

