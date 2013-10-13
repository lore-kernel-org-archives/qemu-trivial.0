Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VVFgg-0005Ak-L3
	for mharc-qemu-trivial@gnu.org; Sun, 13 Oct 2013 03:02:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1VVFgW-0005AV-N6
	for qemu-trivial@nongnu.org; Sun, 13 Oct 2013 03:02:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1VVFgO-0003O1-6s
	for qemu-trivial@nongnu.org; Sun, 13 Oct 2013 03:01:52 -0400
Received: from mail-ea0-x22e.google.com ([2a00:1450:4013:c01::22e]:54601)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1VVFgN-0003Nx-VE; Sun, 13 Oct 2013 03:01:44 -0400
Received: by mail-ea0-f174.google.com with SMTP id z15so2719241ead.33
	for <multiple recipients>; Sun, 13 Oct 2013 00:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=AxXLj/eaCWLUGUFUou6lwFZWp74mjKa6AdtZVTnBIK4=;
	b=UXKtc9RBbu1NnbfPuZbAnkL7L2cKsWgp4zc/z5XxcuYJMamSBz0vlP/ZCakWS1edLU
	B+YUEFeR2/f4YqGa8/Noun3psKv5fTs2MlKXcOiVfT+nJDk+UW2/pC7gj4WndQQfziGT
	w7pitWiDQ/IrE6Mek3yh+diyCYeCNJAO6iwStOK0nkddM6HN/CvEjf7ueADTLC6e8ILR
	d4b37BU5yRvdni1XYoKxO/S9xpDhw+FSgloh2aUPpa0tVVI1sys4rmmMX+Sf/zp0dQuz
	zdtXxgwz6BNPVRDm7EwCSkp8UnC+3CPw9kGNuq87kKgtWRhMoOz49rsXVAPaAGXILElO
	9Zww==
X-Received: by 10.14.221.73 with SMTP id q49mr142250eep.64.1381647702911;
	Sun, 13 Oct 2013 00:01:42 -0700 (PDT)
Received: from yakj.usersys.redhat.com (net-37-116-196-7.cust.dsl.vodafone.it.
	[37.116.196.7]) by mx.google.com with ESMTPSA id
	a43sm136938686eep.9.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 13 Oct 2013 00:01:41 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <525A4555.5000401@redhat.com>
Date: Sun, 13 Oct 2013 09:01:41 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130923 Thunderbird/17.0.9
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1381482317-25433-1-git-send-email-mjt@msgid.tls.msk.ru>
	<525978C8.9010002@redhat.com> <52599D8B.3020200@msgid.tls.msk.ru>
In-Reply-To: <52599D8B.3020200@msgid.tls.msk.ru>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c01::22e
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: create fsdev/ directory
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
X-List-Received-Date: Sun, 13 Oct 2013 07:02:01 -0000

Il 12/10/2013 21:05, Michael Tokarev ha scritto:
> I considered doing it there initially, but decided to add it
> to the other place, because that's where virtfs variable
> is set.  The place you're referring to will need to have a
> condition `if' based on $virtfs value.

It's harmless to create a directory that won't be used.

> Also, there are other places below this virtfs test (which I
> modified) which runs mkdir (dtc, pixman), so this is not
> something unusual.

I didn't check the code, and dtc+pixman are both submodules so there may
be something special there.  But in general, let's avoid the "it's bad
so it's okay to make it worse" argument.

Paolo

