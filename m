Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YX4k3-0001Ta-Lk
	for mharc-qemu-trivial@gnu.org; Sun, 15 Mar 2015 05:21:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33843)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YX4k1-0001SZ-02
	for qemu-trivial@nongnu.org; Sun, 15 Mar 2015 05:21:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YX4jr-0008Ny-SC
	for qemu-trivial@nongnu.org; Sun, 15 Mar 2015 05:21:48 -0400
Received: from mail-wi0-x22f.google.com ([2a00:1450:400c:c05::22f]:35259)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YX4jr-0008Nn-LJ; Sun, 15 Mar 2015 05:21:39 -0400
Received: by wibdy8 with SMTP id dy8so16580144wib.0;
	Sun, 15 Mar 2015 02:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=cNeFC/SimPQNSUWXqlt9HHTGToagGiu8t9HOMKFwKSE=;
	b=xmi/oB5IkwrwPeTygiLpBwxDJiVmnPHzaNX9l6PHDkeihaU0KFQFSpwICQ/+qTRkcx
	74QJCvtqVQeZmlbbjVSHobXuX8yC7rUGg+d10wC+B1zI0TGwbzY9BAlUTqOw6Ymdi4YQ
	Wcbh3L+AIQ1g3NZZ7zsLiKqV/EbupMteLtATTT9pRS45QmxSzbD+1oyFJm/nxnk7Jdh/
	MN18L6rk4fdzu5isBvHDfohBAuj81xAUxDTUzNFKjT0WRA0ZH/Pql+xSqQIwY7lcbTFu
	o3Y751cNkuj04C4c1eeGSVuS4Xl6T0FjNtw63Ul5BChUl9NsjX26AI5wv5aEL8ScCDwo
	YINQ==
X-Received: by 10.180.75.140 with SMTP id c12mr82448494wiw.14.1426411299136;
	Sun, 15 Mar 2015 02:21:39 -0700 (PDT)
Received: from [192.168.10.165] (net-188-216-23-124.cust.vodafonedsl.it.
	[188.216.23.124])
	by mx.google.com with ESMTPSA id s5sm5714558wia.1.2015.03.15.02.21.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 02:21:37 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <55054F1D.2080408@redhat.com>
Date: Sun, 15 Mar 2015 10:21:33 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, Shannon Zhao <zhaoshenglong@huawei.com>, 
	qemu-devel@nongnu.org
References: <1426326454-7216-1-git-send-email-zhaoshenglong@huawei.com>
	<55040865.8050908@weilnetz.de>
In-Reply-To: <55040865.8050908@weilnetz.de>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22f
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com, shannon.zhao@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] hw/bt/sdp: Fix resource leak detect by
	coverity
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
X-List-Received-Date: Sun, 15 Mar 2015 09:21:49 -0000



On 14/03/2015 11:07, Stefan Weil wrote:
> 
> This fixes the memory leak, but I still don't understand what is done here.
> data is allocated, then filled with values, now it is also deallocated.
> But I'm missing the part where all those data is used.

"data" escapes in record->attribute_list[record->attributes].pair.

The bug is in bt_l2cap_sdp_close_ch which does an invalid free every
time it frees the first sdp->service_list[i].attribute_list->pair (but
the qsort could have moved it elsewhere in the list).  The right fix is
to do a separate malloc for each attribute, instead of a single one.

In any case, it seems simpler to just leave this code aside.

Paolo

