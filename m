Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guDii-0004VU-62
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 04:54:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36991)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1guDie-0004Ts-Oa
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 04:54:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1guDid-00006J-5t
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 04:54:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59042)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1guDiZ-0008Lb-FL; Thu, 14 Feb 2019 04:54:07 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ABEA83E2B7;
	Thu, 14 Feb 2019 09:54:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB2B05C226;
	Thu, 14 Feb 2019 09:53:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 7A65211386C5; Thu, 14 Feb 2019 10:53:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert \(git\)" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, kraxel@redhat.com,
	mst@redhat.com, qemu-trivial@nongnu.org
References: <20190212134758.10514-1-dgilbert@redhat.com>
	<20190212134758.10514-3-dgilbert@redhat.com>
Date: Thu, 14 Feb 2019 10:53:58 +0100
In-Reply-To: <20190212134758.10514-3-dgilbert@redhat.com> (David Alan
	Gilbert's message of "Tue, 12 Feb 2019 13:47:56 +0000")
Message-ID: <87o97eae6h.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 14 Feb 2019 09:54:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/4] HMP: Prepend errors
 with 'Error:'
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Feb 2019 09:54:13 -0000

"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> writes:

> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> Always make error messages start with 'Error:' as a fallback
> to make sure that anything parsing them can tell it failed.

Feeding HMP output to programs is a bad idea to begin with.  

> Note: Some places don't use hmp_handle_error

True.  A more honest subject would be "HMP: Prepend some errors with
'Error:'".

Several distinct reasons for not using hmp_handle_error():

* Handling an error that isn't transmitted as an Error object

  HMP command handlers generally wrap around QMP command handlers, which
  always use Error objects.  Still, there are other sources of errors
  when the HMP command does more than the wrapped QMP command (typically
  convenience features for humans), or there is no wrapped QMP command.

* Augmenting the error message

  Reporting with error_reportf_err() is easier than first messing with
  the Error object, then passing it to hmp_handle_error().  Example:
  hmp_delvm().

* hmp_handle_error() is static, and we're outside hmp.c

  Tolerable as long as hmp_handle_error() is trivial.  Your patch makes
  it a bit less trivial.

If we truly want to "Prepend errors with 'Error:'", then we should make
hmp command handlers take an Error ** argument, and leave the reporting
to the HMP core.

If you think prepending some errors is useful (and I guess you do), go
right ahead with this patch.  I'd recommend to use the more honest
subject, though.

