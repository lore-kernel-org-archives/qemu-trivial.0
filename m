Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y9GpK-0006hA-5R
	for mharc-qemu-trivial@gnu.org; Thu, 08 Jan 2015 12:24:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56627)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Y9GpC-0006Wd-7P
	for qemu-trivial@nongnu.org; Thu, 08 Jan 2015 12:24:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Y9GpB-0002IL-Df
	for qemu-trivial@nongnu.org; Thu, 08 Jan 2015 12:24:46 -0500
Received: from mail-wg0-x22b.google.com ([2a00:1450:400c:c00::22b]:49307)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Y9Gp5-0002H7-4y; Thu, 08 Jan 2015 12:24:39 -0500
Received: by mail-wg0-f43.google.com with SMTP id k14so3838622wgh.2;
	Thu, 08 Jan 2015 09:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:newsgroups:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ANiMgZqLAxTOUD9q9t0+8WcXE92paDmjxLNtwFVzdZo=;
	b=U/LlZop0cWW4ApiyqBsRDIo62aYoiQXtVLqb6oVpJY6YiVIeAODUd8g8FeoYB+Pq/1
	r7+ZTd8b/nE7gdIPSiV9IxstGZq4wjBEEEUTDSS4ho8XMEuXETP6kR9F1ts2w7FkWz/V
	IHeMxR5dZUuqFZWoXwW0C6isVDEVhRL5pvC0OG/UhYibdG+hVMvNsMr7XrhdDcTjWkv0
	LFQxoUQdpjYvGT6DM6qRQfT2maS2GxwF4q16VUxQVZFRyvYJzmekhsBkCx4T8Tz0+6gk
	OC9PtnuiArWH8cLYqiDh28RjAWjpVuib3qCCbPmAIsw0eg8++RAH5qgcsWJ1kuPpF9dn
	lm0Q==
X-Received: by 10.194.60.70 with SMTP id f6mr21793381wjr.109.1420737878559;
	Thu, 08 Jan 2015 09:24:38 -0800 (PST)
Received: from [192.168.10.150] (net-37-117-147-67.cust.vodafonedsl.it.
	[37.117.147.67]) by mx.google.com with ESMTPSA id
	la10sm6916327wjc.36.2015.01.08.09.24.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Jan 2015 09:24:37 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <54AEBD53.5010107@redhat.com>
Date: Thu, 08 Jan 2015 18:24:35 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
Newsgroups: gmane.comp.emulators.qemu
To: Thomas Huth <thuth@linux.vnet.ibm.com>
References: <1418638786-29872-1-git-send-email-thuth@linux.vnet.ibm.com>
	<20150108132246.63fed0cb@oc7435384737.ibm.com>
In-Reply-To: <20150108132246.63fed0cb@oc7435384737.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22b
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Makefile: Remove config.status and
 common.env during 'make distclean'
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
X-List-Received-Date: Thu, 08 Jan 2015 17:24:51 -0000



On 08/01/2015 13:22, Thomas Huth wrote:
> On Mon, 15 Dec 2014 11:19:46 +0100
> Thomas Huth <thuth@linux.vnet.ibm.com> wrote:
> 
>> config.status and tests/qemu-iotests/common.env are generated files
>> that should be deleted during 'make distclean'.
>>
>> Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
>> ---
>>  Makefile |    4 ++--
>>  1 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index f505202..6817c6f 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -313,8 +313,8 @@ qemu-%.tar.bz2:
>>
>>  distclean: clean
>>  	rm -f config-host.mak config-host.h* config-host.ld $(DOCS) qemu-options.texi qemu-img-cmds.texi qemu-monitor.texi
>> -	rm -f config-all-devices.mak config-all-disas.mak
>> -	rm -f po/*.mo
>> +	rm -f config-all-devices.mak config-all-disas.mak config.status
>> +	rm -f po/*.mo tests/qemu-iotests/common.env
>>  	rm -f roms/seabios/config.mak roms/vgabios/config.mak
>>  	rm -f qemu-doc.info qemu-doc.aux qemu-doc.cp qemu-doc.cps qemu-doc.dvi
>>  	rm -f qemu-doc.fn qemu-doc.fns qemu-doc.info qemu-doc.ky qemu-doc.kys
> 
> ping?

Applied locally, thanks.

Paolo

