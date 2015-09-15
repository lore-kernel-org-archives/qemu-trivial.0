Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZbuQo-0004Ot-5A
	for mharc-qemu-trivial@gnu.org; Tue, 15 Sep 2015 13:54:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZbuQl-0004Kq-4J
	for qemu-trivial@nongnu.org; Tue, 15 Sep 2015 13:54:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZbuQf-0005Zy-B6
	for qemu-trivial@nongnu.org; Tue, 15 Sep 2015 13:54:11 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42241)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZbuQV-0005UA-4w; Tue, 15 Sep 2015 13:53:55 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4682741A29;
	Tue, 15 Sep 2015 20:53:52 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 2C08EA67;
	Tue, 15 Sep 2015 20:53:52 +0300 (MSK)
Message-ID: <55F85B30.4080601@msgid.tls.msk.ru>
Date: Tue, 15 Sep 2015 20:53:52 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, 
	"Daniel P. Berrange" <berrange@redhat.com>
References: <1433424607-3429-1-git-send-email-berrange@redhat.com>	<CAFEAcA-HAZRJ8jBvWM8tnN-BkYuzBtToPFgzTNEU8oxtqmUtfQ@mail.gmail.com>	<87twu5z7px.fsf@blackfin.pond.sub.org>	<CAFEAcA8ukn66k8OaBFmn08kPRPa1q2HUrOwq9Uep1aMbuWePtw@mail.gmail.com>	<87twu5nmbp.fsf@blackfin.pond.sub.org>
	<55DBB3B8.9080807@redhat.com>	<55F839BC.8060409@redhat.com>
	<20150915155435.GC23145@redhat.com>
	<87h9mvac06.fsf@blackfin.pond.sub.org>
In-Reply-To: <87h9mvac06.fsf@blackfin.pond.sub.org>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v2] Add .dir-locals.el file to configure
 emacs coding style
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
X-List-Received-Date: Tue, 15 Sep 2015 17:54:12 -0000

15.09.2015 19:22, Markus Armbruster wrote:
> "Daniel P. Berrange" <berrange@redhat.com> writes:
[]
>> Personally I be fine with both the minimal approach or the more
>> comprehensive approach of Peter's, but I'd probably tend towards
>> the minimal approach to avoid the warnings problem.
> 
> Seconded.
> 
> The "minimal approach" has been on the list since June, and it has my
> R-by.  It's clearly better than nothing.  Let's commit it now.  We can
> always improve on it later.

Ok, let's apply it.  BTW, Marcus, your R-By wasn't actually clear,
to which version it applies.  Now I see that after your comment.

Applied, finally, to -trivial now, thank you all!

Should I add some more r-by or s-by? :)

Thanks!

/mjt


