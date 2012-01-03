Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ri2xE-0005j1-S7
	for mharc-qemu-trivial@gnu.org; Tue, 03 Jan 2012 06:54:56 -0500
Received: from eggs.gnu.org ([140.186.70.92]:55841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Ri2xC-0005ZC-2c
	for qemu-trivial@nongnu.org; Tue, 03 Jan 2012 06:54:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Ri2xB-0006B7-5U
	for qemu-trivial@nongnu.org; Tue, 03 Jan 2012 06:54:54 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:33354)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Ri2x9-0006Ag-6Y; Tue, 03 Jan 2012 06:54:51 -0500
Received: by eekb45 with SMTP id b45so18605529eek.4
	for <multiple recipients>; Tue, 03 Jan 2012 03:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1ApgNv/FPd9mxeFy44dx9oUUkWmRuKh7qMQqKg5RHrg=;
	b=Dclrep3sQcZGKqnnYVHgTItrh86ETRwbITUdbFQTNgOgWAYYrU7p/hetg32LqxCE+E
	GvFXvIUA3YTXed/5Lq19xt9C7gUiljBtBg93LBXMt1RTcWrlGFsEWJa2IPbQYF3wTN5k
	WAetALz0TizzHa+EI2AJkGM+OVV3/QGnCbqS4=
Received: by 10.14.99.76 with SMTP id w52mr20921432eef.85.1325591690145;
	Tue, 03 Jan 2012 03:54:50 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	b49sm173712910eec.9.2012.01.03.03.54.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Jan 2012 03:54:49 -0800 (PST)
Date: Tue, 3 Jan 2012 11:54:48 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20120103115448.GB28826@stefanha-thinkpad.localdomain>
References: <1325527237-24146-1-git-send-email-pbonzini@redhat.com>
	<1325527237-24146-2-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1325527237-24146-2-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/8] notifier: switch to
	QLIST
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
X-List-Received-Date: Tue, 03 Jan 2012 11:54:54 -0000

On Mon, Jan 02, 2012 at 07:00:30PM +0100, Paolo Bonzini wrote:
>  void notifier_list_add(NotifierList *list, Notifier *notifier)
>  {
> -    QTAILQ_INSERT_HEAD(&list->notifiers, notifier, node);
> +    QLIST_INSERT_HEAD(&list->notifiers, notifier, node);
>  }
>  
> -void notifier_list_remove(NotifierList *list, Notifier *notifier)
> +void notifier_remove(Notifier *notifier)

Why introduce this asymmetry with notifier_list_add() and
notifier_remove()?  Please make the function names consistent.

Stefan

