Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ri3Bh-0002Fl-Er
	for mharc-qemu-trivial@gnu.org; Tue, 03 Jan 2012 07:09:53 -0500
Received: from eggs.gnu.org ([140.186.70.92]:41719)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Ri3Ba-0001sL-Ux
	for qemu-trivial@nongnu.org; Tue, 03 Jan 2012 07:09:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Ri3BV-00007l-3G
	for qemu-trivial@nongnu.org; Tue, 03 Jan 2012 07:09:46 -0500
Received: from mail-wi0-f173.google.com ([209.85.212.173]:58980)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Ri3BS-000079-Oe; Tue, 03 Jan 2012 07:09:38 -0500
Received: by wibhm2 with SMTP id hm2so10338632wib.4
	for <multiple recipients>; Tue, 03 Jan 2012 04:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=oQYSAgwHqCYfZaaJjYNTcskxVEKc+kwWL0Xy3g8DJp0=;
	b=TKFBhcE4N6RCvmbYQ7CllY04GryxzPHfv2z7R+EoMeau0fBg8AYuAqVsICSK+D+W4l
	FYXasSk2cBEZtuQEyVsGkLybiIHFFwSp0MFCJkAENMMG/wNkNvq/BHa8xCglb3beWSV6
	hEp8GVA2FT3FypgKEc6ADFFN2Wl4l5Q08vC+w=
MIME-Version: 1.0
Received: by 10.180.8.229 with SMTP id u5mr113273633wia.9.1325592577819; Tue,
	03 Jan 2012 04:09:37 -0800 (PST)
Received: by 10.180.101.135 with HTTP; Tue, 3 Jan 2012 04:09:37 -0800 (PST)
In-Reply-To: <4F02EDBA.8090808@redhat.com>
References: <1325527237-24146-1-git-send-email-pbonzini@redhat.com>
	<1325527237-24146-2-git-send-email-pbonzini@redhat.com>
	<20120103115448.GB28826@stefanha-thinkpad.localdomain>
	<4F02EDBA.8090808@redhat.com>
Date: Tue, 3 Jan 2012 12:09:37 +0000
Message-ID: <CAJSP0QWSdap31ejeymG4v6yPUKM7CTMnCFVi4JOMXzKMb22fBg@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.212.173
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
X-List-Received-Date: Tue, 03 Jan 2012 12:09:51 -0000

On Tue, Jan 3, 2012 at 11:59 AM, Paolo Bonzini <pbonzini@redhat.com> wrote:
> On 01/03/2012 12:54 PM, Stefan Hajnoczi wrote:
>>
>> On Mon, Jan 02, 2012 at 07:00:30PM +0100, Paolo Bonzini wrote:
>>>
>>> =A0void notifier_list_add(NotifierList *list, Notifier *notifier)
>>> =A0{
>>> - =A0 =A0QTAILQ_INSERT_HEAD(&list->notifiers, notifier, node);
>>> + =A0 =A0QLIST_INSERT_HEAD(&list->notifiers, notifier, node);
>>> =A0}
>>>
>>> -void notifier_list_remove(NotifierList *list, Notifier *notifier)
>>> +void notifier_remove(Notifier *notifier)
>>
>>
>> Why introduce this asymmetry with notifier_list_add() and
>> notifier_remove()? =A0Please make the function names consistent.
>
>
> Because notifier_list_add adds the notifier to a specific NotifierList;
> notifier_remove removes the notifier from whatever list it is in.
>
> Normally whoever implements notifiers does not have access to the
> NotifierList, so there are wrappers for both notifier_list_add and
> notifier_list_remove. =A0This patch changes things so that the wrappers f=
or
> notifier_remove are not needed anymore (though this series was already bi=
g
> enough, so I left the wrappers in).

I see.

Stefan

