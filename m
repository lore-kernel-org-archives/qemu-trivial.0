Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XPLpA-0007WX-TB
	for mharc-qemu-trivial@gnu.org; Wed, 03 Sep 2014 21:26:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XPLoz-0007WI-NM
	for qemu-trivial@nongnu.org; Wed, 03 Sep 2014 21:26:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XPLop-00047N-DF
	for qemu-trivial@nongnu.org; Wed, 03 Sep 2014 21:26:45 -0400
Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233]:58671)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1XPLop-00047J-4o; Wed, 03 Sep 2014 21:26:35 -0400
Received: by mail-pa0-f51.google.com with SMTP id rd3so18641198pab.24
	for <multiple recipients>; Wed, 03 Sep 2014 18:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Ig0/D4LUD5+e5k0EeVFkBBJxpma9ITF71c2NGUvrr0M=;
	b=hRDF0bf+Ryh8pmLhz1fpP9r7KfvwTBm8eLNHOppTRi+qvUT83wTMz3cATbXOZLdKOP
	UCdB2c+B9o9Eor2+WCOLr0MPxYKm3RZZcSJo8Sm60W4GfpcqHjADWs4g0rxXaG9EFMkk
	nLMlUUrOzc5BwG4pvxOdcv8p50lxsaavSKDW+Fo0WGzosK9JCOapcr7wuLGxeI+moM5d
	67PPP0MQ3yKkhFO0znriKuRF5O9FvgrBZdM5dXyI8cFfyYBjHxwZp7yGEtazgAW0nIsf
	QhQ2Lr5KfOZEpM9ko752SQiXquzQlizaJEU0cc3k0vT3VFgF7KeauC/8QCHA/w5CtdZY
	K/tA==
X-Received: by 10.70.103.204 with SMTP id fy12mr2272531pdb.144.1409793993158; 
	Wed, 03 Sep 2014 18:26:33 -0700 (PDT)
Received: from ShengShiZhuChengdeMacBook-Pro.local ([124.126.237.240])
	by mx.google.com with ESMTPSA id c6sm129068pbu.59.2014.09.03.18.26.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Sep 2014 18:26:32 -0700 (PDT)
Message-ID: <5407C0FD.6060406@gmail.com>
Date: Thu, 04 Sep 2014 09:31:41 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.0
MIME-Version: 1.0
To: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
References: <5405EED9.2090701@gmail.com> <54066F78.7040101@gmail.com>
	<alpine.DEB.2.02.1409040024100.18866@kaball.uk.xensource.com>
In-Reply-To: <alpine.DEB.2.02.1409040024100.18866@kaball.uk.xensource.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::233
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, xen-devel@lists.xensource.com,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] xen-hvm.c: Improve the return method for
	xen_hvm_init()
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
X-List-Received-Date: Thu, 04 Sep 2014 01:26:55 -0000

On 9/4/14 7:32, Stefano Stabellini wrote:
> On Wed, 3 Sep 2014, Chen Gang wrote:
>> On 9/3/14 0:22, Chen Gang wrote:
[...]
>>> xen_hvm_init() may also return -errno, which may let upper caller think
>>> more (e.g. free some other related resources and try again), although at
>>> present, all related upper callers still exit(1).
> 
> I think we should return -1 in the other cases too
> 

[...]
>>> @@ -998,6 +999,7 @@ int xen_hvm_init(ram_addr_t *below_4g_mem_size, ram_addr_t *above_4g_mem_size,
>>>      state->xenstore = xs_daemon_open();
>>>      if (state->xenstore == NULL) {
>>>          perror("xen: xenstore open");
>>> +        xc_evtchn_close(state->xce_handle);
>>>          g_free(state);
>>>          return -errno;
>>>      }
> 
> just return -1 and do the same in the above check (xce_handle ==
> XC_HANDLER_INITIAL_VALUE)
> 
> 

OK thanks, what you said sounds OK to me. I shall send patch v2 for it
within the 2 days (within 2014-09-05).

Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

