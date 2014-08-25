Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XLueT-0004d6-Fr
	for mharc-qemu-trivial@gnu.org; Mon, 25 Aug 2014 09:49:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tommusta@gmail.com>) id 1XLueL-0004PO-EV
	for qemu-trivial@nongnu.org; Mon, 25 Aug 2014 09:49:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tommusta@gmail.com>) id 1XLueF-000215-Gt
	for qemu-trivial@nongnu.org; Mon, 25 Aug 2014 09:49:33 -0400
Received: from mail-qc0-x232.google.com ([2607:f8b0:400d:c01::232]:36896)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tommusta@gmail.com>)
	id 1XLue3-0001yx-Bl; Mon, 25 Aug 2014 09:49:15 -0400
Received: by mail-qc0-f178.google.com with SMTP id x3so13997283qcv.9
	for <multiple recipients>; Mon, 25 Aug 2014 06:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=tWYEaPlTMHtVdQE2Tpi0MMyfq3xwYMdzUmiVg6B3UkE=;
	b=gJ6mt4mb/hmd+SabFsk99x1Tv+O9DXdIm10T2L8ZsKPb8YkCXhyX1V85KwP8/nUfUV
	UCGz8slE74/nkzPY3UA6pGWZjsJqxbxx17UOsxQRppG0XYBAAjfmgsRFbDqkKLh3rZ05
	tkWcX4CaCpIjJOxZ18dtTa5AiZ47cJWiEa6Bo8/NOUefNLO+nrEvKMOeMC/9npsA78yB
	++bwR/4ghJ64zGE2XNLmmaMBmeNHJu8+aiLfFGTaMPIZvF17OmnEQdCA7ik3ij0bk42u
	kPHOl5DP8oDv6isfSQzcb5OsErRjG7IhplVwPAvuIic/XY8EVu1nSPvy8XSUFelFi0R+
	Onew==
X-Received: by 10.140.104.213 with SMTP id a79mr33397427qgf.46.1408974554191; 
	Mon, 25 Aug 2014 06:49:14 -0700 (PDT)
Received: from [9.10.87.78] (rchp4.rochester.ibm.com. [129.42.161.36])
	by mx.google.com with ESMTPSA id l3sm4869112qay.0.2014.08.25.06.49.12
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 25 Aug 2014 06:49:13 -0700 (PDT)
Message-ID: <53FB3ED4.2000902@gmail.com>
Date: Mon, 25 Aug 2014 08:49:08 -0500
From: Tom Musta <tommusta@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, Michael Tokarev <mjt@tls.msk.ru>, 
	qemu-devel@nongnu.org
References: <1408525330-25414-1-git-send-email-sw@weilnetz.de>	<53F9AE86.7040700@msgid.tls.msk.ru>
	<53F9B372.10602@weilnetz.de>
In-Reply-To: <53F9B372.10602@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c01::232
Cc: qemu-trivial@nongnu.org, Alexander Graf <agraf@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] libdecnumber: Fix warnings
 from smatch (missing static, boolean operations)
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
X-List-Received-Date: Mon, 25 Aug 2014 13:49:39 -0000

On 8/24/2014 4:42 AM, Stefan Weil wrote:
> Am 24.08.2014 11:21, schrieb Michael Tokarev:
>> Applied to -trivial, thank you!
>>
>> But I've a small concern - should we really do this on "external" sources,
>> and divirge from upstream needlessly?
>>
>> Thanks,
>>
>> /mjt
> 
> In general, I agree. In this case, the code was part of gcc, and newer versions of gcc use GPL 3 which is incompatible with QEMU, so I assume that the code in QEMU is no longer available from a maintained upstream.
> 
> Stefan
> 
> 
> 

Yes.  We had to effectively fork a copy the code to deal with the license issues.

FWIW ... Alex has suggested a reformat of the libdecnumber code to make it compatible with QEMU formatting (http://lists.nongnu.org/archive/html/qemu-ppc/2014-05/msg00085.html).  This is on my todo list.  Obviously, such a reformat would make it even
harder to synchronize with upstream gcc.


