Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XUtGJ-0008Tb-K2
	for mharc-qemu-trivial@gnu.org; Fri, 19 Sep 2014 04:09:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52876)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1XUtGC-0008Sr-Mm
	for qemu-trivial@nongnu.org; Fri, 19 Sep 2014 04:09:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1XUtG7-0000y1-9G
	for qemu-trivial@nongnu.org; Fri, 19 Sep 2014 04:09:44 -0400
Received: from mail-we0-x229.google.com ([2a00:1450:400c:c03::229]:56112)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1XUtG7-0000xI-3G; Fri, 19 Sep 2014 04:09:39 -0400
Received: by mail-we0-f169.google.com with SMTP id w61so2090037wes.14
	for <multiple recipients>; Fri, 19 Sep 2014 01:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=xBZvBXE+LXicyLUW/j71A6KoV/QuZVKxh/HeLsUlCFI=;
	b=nhNSetRgfhILUzD56ElrojiLfEyD1dN2OYFjQ9UJpqRCKgZoyb5bUNZDjkN/R3Z47p
	bWuS27PtvONXtfN9XtBHi1y8fMOuZJSDW85gM5NGo05YD/NZ2HisyLl8vcyfHkhpZQid
	oBCFr6RCMsl8wZU3kjl2o+/57eWfuQ2Fi+bbpmBEJYzJoB7L57uIBfIcDfG+DUDcaXjT
	WncI2nI+bkLwuiBd/xkZrm4J9EBRq0Zr94LoJLwUXM+6qwWgTkZPK0imzSeFTVoAuLsG
	aDFfYNrcAy/Sc/i7yNFJUt+fMtwz2vFY0i46L76Xl0j5mRMThIsLr2PdGR4if5sybwsF
	p+vg==
X-Received: by 10.180.73.73 with SMTP id j9mr4444940wiv.77.1411114173301;
	Fri, 19 Sep 2014 01:09:33 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-116-212-135.cust.vodafonedsl.it. [37.116.212.135])
	by mx.google.com with ESMTPSA id om1sm1353903wjc.42.2014.09.19.01.09.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Sep 2014 01:09:32 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <541BE4B8.3010609@redhat.com>
Date: Fri, 19 Sep 2014 10:09:28 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 qemu-devel@nongnu.org
References: <1411097848-3900-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1411097848-3900-1-git-send-email-zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::229
Cc: qemu-trivial@nongnu.org, luonengjun@huawei.com, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH v1] vl: Fix possible freed memory
	accessing
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
X-List-Received-Date: Fri, 19 Sep 2014 08:09:50 -0000

Il 19/09/2014 05:37, zhanghailiang ha scritto:
> The logic of pcmcia_socket_unregister is wrong,
> which will cause a freed memory accessing
> 
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
> Hi,
> 
> The function pcmcia_socket_unregister seemes to be unused,
> Should it be removed? Thanks.

Perhaps---however, the patch silences a Coverity warning, so it is
worthwhile.  Thanks for doing this!

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

