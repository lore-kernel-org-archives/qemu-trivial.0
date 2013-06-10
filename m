Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmAbZ-0005j3-1t
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 18:30:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UmAbT-0005ip-IP
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 18:30:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UmAbN-00059A-Bt
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 18:30:19 -0400
Received: from mail-bk0-x233.google.com ([2a00:1450:4008:c01::233]:44058)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UmAbN-00058r-68
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 18:30:13 -0400
Received: by mail-bk0-f51.google.com with SMTP id ji1so2835725bkc.38
	for <qemu-trivial@nongnu.org>; Mon, 10 Jun 2013 15:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=iKC+fKhRVnxKEfPY/gZraZbsJXvsL+1WdXSxvReaV+Q=;
	b=WwuvE1aH9vfmRD9jlcbLOKIMj0CI31kq5fHRYJukZurtTO3WsyEGEpjDCspqlZYoot
	pjoHEQpbapd4LTI3xA/zHjf0AZadEfPT2zsiJbME8e+eXLUlaoigiGRSia2HA9z9PfV5
	OnFj2JZK5ItZymbUqIZRW5IAwX+yzotzeXkAa1t827c6IeV58B6g2QsJnltiiw/TSTRb
	UIOuXDN2PcwsVDSWqvz5PtsZxKBOCSO44hhdL0jA20p8nKFC8mE9QuxSDzVOaUcDnWC8
	q+3KnoH+pfGT2gMgGWL2rWw8xI2MK65FA2ZzshWeVHtUHCPPyNlClXZRjkk0mqj1e1Cs
	ghKQ==
MIME-Version: 1.0
X-Received: by 10.204.191.132 with SMTP id dm4mr1847054bkb.66.1370903412257;
	Mon, 10 Jun 2013 15:30:12 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.204.35.136 with HTTP; Mon, 10 Jun 2013 15:30:12 -0700 (PDT)
In-Reply-To: <20130610170649.GA31588@redhat.com>
References: <1370439748-18092-1-git-send-email-hpoussin@reactos.org>
	<51B2E26F.8030106@msgid.tls.msk.ru> <51B563CC.5040907@redhat.com>
	<CAEgOgz6PmZ+gvhH9vVFiVqMvNXOBDn3Y+ny=tW+QHEu-eZ-LcQ@mail.gmail.com>
	<20130610170649.GA31588@redhat.com>
Date: Tue, 11 Jun 2013 08:30:12 +1000
X-Google-Sender-Auth: daazZ0jksKhJrjC57k-8PCkFTOw
Message-ID: <CAEgOgz6Y63HOAF+57p+mubiz2ySfLtuuoVJKbign6gxWNJvWtA@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
X-Gm-Message-State: ALoCoQnzssv/3ghZtNS3Iijjes3/leihnKx2h3/kz2r/v3qBjFxtz4fZl89DBAkC1P/oER0f/e5f
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4008:c01::233
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	=?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ioport/memory: check that
 both .read and .write callbacks are defined
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
X-List-Received-Date: Mon, 10 Jun 2013 22:30:24 -0000

Hi Michael,

On Tue, Jun 11, 2013 at 3:06 AM, Michael S. Tsirkin <mst@redhat.com> wrote:
> On Mon, Jun 10, 2013 at 07:14:45PM +1000, Peter Crosthwaite wrote:
>> Hi,
>>
>> On Mon, Jun 10, 2013 at 3:27 PM, Gerd Hoffmann <kraxel@redhat.com> wrote:
>> >   Hi,
>> >
>> >> Maybe instead (or in addition to), we should provide a dummy
>> >> read or write functions -- instead of fixing each such occurence
>> >> to use its own dummy function
>> >
>> > Makes sense, especially for write where we can just ignore what the
>> > guest attempts to write.  Not sure we can have a generic handler for
>> > reads.  Maybe two, one which returns 0xff and one which returns 0x00.
>> >
>>
>> FWIW, I have one in my tree that qemu_log(LOG_GUEST_ERROR's such
>> accesses that I use for unimplemented devices. It's worthwhile to trap
>> such accesses and speaking for the Xilinx LQSPI case, my preference is
>> for some form of failure rather than silent write-ignore. And can we
>> have an option where a invalid writes have consistent behavior with
>> unassigned accesses?
>>
>> Regards,
>> Peter
>
> Probably not a good idea. Ignoring unassigned addresses
> is very handy for compatibility: we can run new guests
> on old qemu and They don't crash or log errors.
>

Log errors do not crash QEMU even if they are enabled. They just make
noise and even then only if you pass -d guest_errors (which we do as
pretty much habit now for this reason). It is the compromise solution
between those of us who want to ignore them and those of us who need
to know about them. The default behavior will still be to ignore
accesses with no action.

Regards,
Peter

>> > cheers,
>> >   Gerd
>> >
>> >
>

