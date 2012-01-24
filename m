Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RpbdB-0003HF-N2
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2012 03:21:29 -0500
Received: from eggs.gnu.org ([140.186.70.92]:47570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Rpbd4-0003Gw-IQ
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2012 03:21:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Rpbcx-0006Kq-JV
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2012 03:21:22 -0500
Received: from mail-iy0-f173.google.com ([209.85.210.173]:38640)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Rpbcx-0006Kg-D6; Tue, 24 Jan 2012 03:21:15 -0500
Received: by iahk25 with SMTP id k25so4158257iah.4
	for <multiple recipients>; Tue, 24 Jan 2012 00:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:message-id:date:from:user-agent:mime-version:newsgroups:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=fkvs+cQ62CoNBXPeQAQB6A+HVPEHvWIEXCjL+rbXOmI=;
	b=bGDXRI5dymfF0yWkrogoXm4IVc2PaiymI/69iPLpIANyGeuBqVLp1OCkCdCTCbDA2t
	rp95mlFXxYlJBkfv3OKUCzx927vmSu+0NSTtV0VPlV0lc4hvv8wuOcdPKPawNBAAQs8N
	w/YYtc5Ado4bgi9odZnvfe8lj+wYcfAnVlVAo=
Received: by 10.42.151.196 with SMTP id f4mr12691873icw.29.1327393274357;
	Tue, 24 Jan 2012 00:21:14 -0800 (PST)
Received: from yakj.usersys.redhat.com (93-34-182-16.ip50.fastwebnet.it.
	[93.34.182.16])
	by mx.google.com with ESMTPS id or1sm28146538igc.3.2012.01.24.00.21.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jan 2012 00:21:13 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <4F1E69F3.4040406@redhat.com>
Date: Tue, 24 Jan 2012 09:21:07 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
Newsgroups: gmane.comp.emulators.qemu
To: Thomas Higdon <thigdon@akamai.com>
References: <20120123171525.GM32632@akamai.com> <4F1D9D4A.3000104@redhat.com>
	<20120123181426.GA14494@akamai.com>
In-Reply-To: <20120123181426.GA14494@akamai.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>, Paul Brook <paul@codesourcery.com>
Subject: Re: [Qemu-trivial] [PATCH] scsi: restrict buffer length to
 req->cmd.xfer for responses to INQUIRY commands.
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
X-List-Received-Date: Tue, 24 Jan 2012 08:21:28 -0000

On 01/23/2012 07:14 PM, Thomas Higdon wrote:
> >  Can you please also do the same REPORT LUNS and INQUIRY in hw/scsi-bus.c?
>
> You're talking about the scsi_target_emulate_report_luns() and
> scsi_target_emulate_inquiry() functions in hw/scsi-bus.c? By my read of
> the code, these appear safe. In both functions, I see len getting set
> via calls to MIN with r->req->cmd.xfer as one of the arguments. If
> you're referring to something else, can you be more specific?

Ugh, you're right, sorry.  I just looked for if.*xfer.

Paolo

