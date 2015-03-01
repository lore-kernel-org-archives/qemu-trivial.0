Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YS0lW-0007Gi-VB
	for mharc-qemu-trivial@gnu.org; Sun, 01 Mar 2015 05:06:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YS0lU-0007Dr-TI
	for qemu-trivial@nongnu.org; Sun, 01 Mar 2015 05:06:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YS0lR-0003MZ-Nv
	for qemu-trivial@nongnu.org; Sun, 01 Mar 2015 05:06:24 -0500
Received: from mail-wi0-x22b.google.com ([2a00:1450:400c:c05::22b]:39390)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YS0lR-0003MM-HC; Sun, 01 Mar 2015 05:06:21 -0500
Received: by widex7 with SMTP id ex7so8734571wid.4;
	Sun, 01 Mar 2015 02:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=XKW5BWuG6t/0azkUPWTVYKtYb3u0NtFBOdrrtmiP2mU=;
	b=xJgZd91zKRMST2QUeqr8+DWrYJpLI0UuQ6taCvNAKU4X3K8+Th4HA2P0wuJLHJYrEl
	nw5/pwGspN3sls6mzWCfKl0O67gS6IU5qtWEMySGgjdWeogghKf4QC63dn5hHpRqT3T8
	ZQRMBM7KoLwgy+fE1PanOgAcporMIbY7tSu3BqRkWBZnFagihpvFOb3b+Xg+oMEI1T70
	ibBEPtm4jkS84n+S6C9WuX4avvBJBFydvQLX/b1KFOZMhazdL7oDbSVPbgvUe2e3hyzR
	SsnoV+yRCRLN9yO5GScSCfgmnHogqvPFv/HiHN44It3WUuk/U+wUxxhLng9YZS8rx1Pi
	lFJA==
X-Received: by 10.194.109.9 with SMTP id ho9mr46135892wjb.29.1425204379785;
	Sun, 01 Mar 2015 02:06:19 -0800 (PST)
Received: from [192.168.10.150] (net-37-116-207-136.cust.vodafonedsl.it.
	[37.116.207.136]) by mx.google.com with ESMTPSA id
	hv5sm13990190wjb.16.2015.03.01.02.06.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 Mar 2015 02:06:17 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <54F2E496.7000700@redhat.com>
Date: Sun, 01 Mar 2015 11:06:14 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, Michael Tokarev <mjt@tls.msk.ru>, 
	arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1425118124-11888-1-git-send-email-arei.gonglei@huawei.com>	<54F194B7.9080603@msgid.tls.msk.ru>	<54F1EF7A.4040007@redhat.com>
	<54F1F13C.9070204@weilnetz.de>
In-Reply-To: <54F1F13C.9070204@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22b
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] e500: fix memory leak
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
X-List-Received-Date: Sun, 01 Mar 2015 10:06:25 -0000



On 28/02/2015 17:47, Stefan Weil wrote:
>> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> Which one of the two patch variants did you review?
> 
> I suggest using Michael's version (only one g_free as early as
> possible). For that variant, my review may be added:
> 
> Reviewed-by: Stefan Weil <sw@weilnetz.de>

I also referred to Michael's.

Paolo

