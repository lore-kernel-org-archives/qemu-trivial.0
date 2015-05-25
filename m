Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yx1NK-0002dM-9K
	for mharc-qemu-trivial@gnu.org; Mon, 25 May 2015 19:01:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Yx1NI-0002dF-7R
	for qemu-trivial@nongnu.org; Mon, 25 May 2015 19:01:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Yx1NF-00032B-3P
	for qemu-trivial@nongnu.org; Mon, 25 May 2015 19:01:36 -0400
Received: from mail-wi0-x235.google.com ([2a00:1450:400c:c05::235]:33455)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Yx1NE-000327-TU; Mon, 25 May 2015 19:01:33 -0400
Received: by wicmx19 with SMTP id mx19so49879728wic.0;
	Mon, 25 May 2015 16:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=WpFHaRo+LewLLvtTyANBtiXVATd8D2kZzFOHu2OurpI=;
	b=DzZ6mhi7E7sHZ69AXhA8dAkItjPdBQw89qumLUo0FqToCXuIPdgDTh2y+OGFxvm9jG
	F3jnc8WXacIFCT7YVkVpIjOdpePRxhNMa0Sr5CM8/e4+eR1kPnv8nRrDrcvQWsfrEvYm
	+tHrZbAd6lTUFHoaTMHoWutWk6lfcPNo1EN5gvFzujoIIytoDmLsNDHc/POSYprvUm6f
	OpEGcsz9zVrcvJFnX8hJtxLukk+uS6Lv7vphGUVdtmqODDrGshk2VJ8KiC96hTUdmUjD
	sKEFAE9LEV8o2kG2UCC+Mqt+FjSEBkOnF1uFB3Ryym3vr7I1CXHAQ2yl6W3WKASQK/Mj
	t1vw==
X-Received: by 10.180.206.45 with SMTP id ll13mr26181306wic.94.1432594892185; 
	Mon, 25 May 2015 16:01:32 -0700 (PDT)
Received: from [172.20.10.5] ([5.170.159.146]) by mx.google.com with ESMTPSA id
	pr7sm10790791wjc.15.2015.05.25.16.01.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 May 2015 16:01:30 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <5563A9C5.1000603@redhat.com>
Date: Tue, 26 May 2015 01:01:25 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Alexander Graf <agraf@suse.de>, 
	Peter Crosthwaite <crosthwaitepeter@gmail.com>, qemu-devel@nongnu.org
References: <1432498814-1469-1-git-send-email-crosthwaite.peter@gmail.com>
	<55638A0C.1000902@suse.de>
In-Reply-To: <55638A0C.1000902@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::235
Cc: qemu-trivial@nongnu.org, afaerber@suse.de,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH v2] device-tree: Make a common-obj
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
X-List-Received-Date: Mon, 25 May 2015 23:01:37 -0000



On 25/05/2015 22:46, Alexander Graf wrote:
> 
> On 24.05.15 22:20, Peter Crosthwaite wrote:
>> > There is no reason for device tree API to be built per-target.
>> > common-obj it. There is an extraneous inclusion of config.h that
>> > needs to be removed.
>> > 
>> > Cc: Alexander Graf <agraf@suse.de>
>> > Reviewed-by: Andreas Färber <afaerber@suse.de>
>> > Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> Doesn't this mean that we're now linking against libfdt on
> qemu-system-x86_64?

We already are.

Paolo

