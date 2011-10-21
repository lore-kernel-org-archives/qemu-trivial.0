Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RH8hQ-0004dB-Vd
	for mharc-qemu-trivial@gnu.org; Fri, 21 Oct 2011 02:35:24 -0400
Received: from eggs.gnu.org ([140.186.70.92]:39902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RH8hO-0004co-Hr
	for qemu-trivial@nongnu.org; Fri, 21 Oct 2011 02:35:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RH8hM-0004bz-S4
	for qemu-trivial@nongnu.org; Fri, 21 Oct 2011 02:35:22 -0400
Received: from mail-ww0-f41.google.com ([74.125.82.41]:32884)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1RH8hM-0004bj-FY; Fri, 21 Oct 2011 02:35:20 -0400
Received: by wwe32 with SMTP id 32so425885wwe.4
	for <multiple recipients>; Thu, 20 Oct 2011 23:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:message-id:date:from:user-agent:mime-version:newsgroups:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=7Ltj5ELldDTLs2VQvMqXwfqVrpyoyT7I4flWZb8Q428=;
	b=CzFcqqBPlYVxTgMakWlHQurKNQPauYOkprdSCJcH0jFtkAm9fiwVhc9FFHh4gFK2iu
	JjVDM9LEIKxE8aL2R3LqPX7s1gkxg829wt8bR0Qy7S4fGEesLffGaNEqX8PNth1MmS54
	xOi3zqaiNYGtrPTSH9IV+cmQczMdnqOeHQglc=
Received: by 10.227.197.194 with SMTP id el2mr5058395wbb.41.1319178919026;
	Thu, 20 Oct 2011 23:35:19 -0700 (PDT)
Received: from yakj.usersys.redhat.com (93-34-218-143.ip51.fastwebnet.it.
	[93.34.218.143])
	by mx.google.com with ESMTPS id i29sm19769162wbp.22.2011.10.20.23.35.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 23:35:18 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <4EA112A4.5000106@redhat.com>
Date: Fri, 21 Oct 2011 08:35:16 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
Newsgroups: gmane.comp.emulators.qemu
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1318958255-14008-1-git-send-email-pavel.borzenkov@gmail.com>
	<20111020172301.GA14359@stefanha-thinkpad.localdomain>
In-Reply-To: <20111020172301.GA14359@stefanha-thinkpad.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.41
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Pavel Borzenkov <pavel.borzenkov@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH] qed: don't pass NULL to memcpy
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
X-List-Received-Date: Fri, 21 Oct 2011 06:35:23 -0000

On 10/20/2011 07:23 PM, Stefan Hajnoczi wrote:
> On Tue, Oct 18, 2011 at 09:17:35PM +0400, Pavel Borzenkov wrote:
>> Spotted by Clang Analyzer
>>
>> Signed-off-by: Pavel Borzenkov<pavel.borzenkov@gmail.com>
>> ---
>>   block/qed.c |    6 ++++--
>>   1 files changed, 4 insertions(+), 2 deletions(-)
>
> Thanks, applied to the trivial patches tree:
> http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

I think there are other places in the tree where we assume that 
"memcpy(dest, NULL, 0);" works.

Paolo

