Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZU1uG-0003or-Dd
	for mharc-qemu-trivial@gnu.org; Mon, 24 Aug 2015 20:16:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35490)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZU1uD-0003m8-PT
	for qemu-trivial@nongnu.org; Mon, 24 Aug 2015 20:16:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZU1uC-0008GW-St
	for qemu-trivial@nongnu.org; Mon, 24 Aug 2015 20:16:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45777)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1ZU1u6-0008D7-Uj; Mon, 24 Aug 2015 20:15:55 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id DB6898E37F;
	Tue, 25 Aug 2015 00:15:53 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-163.bos.redhat.com
	[10.18.17.163])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7P0FqUT020667; Mon, 24 Aug 2015 20:15:53 -0400
To: Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1433424607-3429-1-git-send-email-berrange@redhat.com>
	<CAFEAcA-HAZRJ8jBvWM8tnN-BkYuzBtToPFgzTNEU8oxtqmUtfQ@mail.gmail.com>
	<87twu5z7px.fsf@blackfin.pond.sub.org>
	<CAFEAcA8ukn66k8OaBFmn08kPRPa1q2HUrOwq9Uep1aMbuWePtw@mail.gmail.com>
	<87twu5nmbp.fsf@blackfin.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <55DBB3B8.9080807@redhat.com>
Date: Mon, 24 Aug 2015 20:15:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <87twu5nmbp.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] Add .dir-locals.el file
 to configure emacs coding style
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
X-List-Received-Date: Tue, 25 Aug 2015 00:16:02 -0000



On 06/18/2015 10:05 AM, Markus Armbruster wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> On 18 June 2015 at 10:28, Markus Armbruster <armbru@redhat.com> wrote:
>>> However, I can't see how I could define a new C style there without
>>> pushing the "local variables" feature well beyond its intended use, and
>>> triggering the confirmation prompts.
>>
>> We wouldn't want to define a new C style, but in general the items
>> I have in my config over the Stroustrup defaults are going to be there
>> because I've noticed something where Stroustrup doesn't indent right...
> 
> As far as I can see, the difference bwteen stroustrup style and yours is
> a few tweaks to c-offsets-alist and c-hanging-braces-alist.  I'm not
> sure how to do that from .dir-locals.el.
> 
>>> If we take Dan's patch, every Emacs user who hasn't already configured a
>>> suitable style profits.  Users who have may have to adjust their
>>> configuration to work with or around Dan's patch.
>>
>> Is there some way to tell whether your emacs has picked up the local
>> style info rather than the one you have in your .emacs ?
> 
> The obvious way is to check the buffer-local variables.  Buffer-local
> variable c-indentation-style is the name of the style in use.  Without
> anything in .emacs or local variables, it's "gnu".  With your
> (c-add-style "qemu" qemu-c-style) in .emacs, it should be "qemu".  With
> Dan's .dir-locals.el, it should be "stroustrup".
> 
> When you can't or don't want to create or modify a .dir-locals.el, you
> can do something like this instead:
> 
>     (dir-locals-set-class-variables 'qemu '((c-mode . ((c-file-style . "qemu")))))
>     (dir-locals-set-directory-class "~/work/qemu" 'qemu)
> 
> This *overrides* .dir-locals.el in my testing.
> 

ping -- any love for this for 2.5?

