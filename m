Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g3A6G-0002vt-6f
	for mharc-qemu-trivial@gnu.org; Thu, 20 Sep 2018 21:19:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>) id 1g3A6D-0002ua-B7
	for qemu-trivial@nongnu.org; Thu, 20 Sep 2018 21:19:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>) id 1g3A6C-0005cX-Jl
	for qemu-trivial@nongnu.org; Thu, 20 Sep 2018 21:19:13 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:5428)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>)
	id 1g3A65-00059M-U8; Thu, 20 Sep 2018 21:19:06 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.17]) by
	rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id
	2ee65ba446fdfc1-5caec; Fri, 21 Sep 2018 09:18:55 +0800 (CST)
X-RM-TRANSID: 2ee65ba446fdfc1-5caec
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.149])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id
	2ee95ba446fdd37-7ba9f; Fri, 21 Sep 2018 09:18:55 +0800 (CST)
X-RM-TRANSID: 2ee95ba446fdd37-7ba9f
To: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	"Michael S. Tsirkin" <mst@redhat.com>, QEMU Trivial
	<qemu-trivial@nongnu.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	Alexander Graf <agraf@suse.de>, Michael Clark <mjc@sifive.com>,
	qemu-ppc <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Markus Armbruster <armbru@redhat.com>, Richard Henderson <rth@twiddle.net>
References: <1537441712-17177-1-git-send-email-maozhongyi@cmss.chinamobile.com>
	<20180920173453.GP30558@habkost.net>
	<CAFEAcA_9uqokbJ4mAbZ4h2_YMhLJBYx=f8u+iUcg5VherfKJLw@mail.gmail.com>
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Message-ID: <496ef39e-192d-2827-bd05-723468d6b8ee@cmss.chinamobile.com>
Date: Thu, 20 Sep 2018 21:18:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_9uqokbJ4mAbZ4h2_YMhLJBYx=f8u+iUcg5VherfKJLw@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------BC2DF87B1F00B800107BAA85"
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 221.176.66.80
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Drop the "qemu:" prefix
 from error_report()
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
X-List-Received-Date: Fri, 21 Sep 2018 01:19:15 -0000

This is a multi-part message in MIME format.
--------------BC2DF87B1F00B800107BAA85
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/20/18 1:39 PM, Peter Maydell wrote:
>>>       if (flags & 0x00000004) { /* MULTIBOOT_HEADER_HAS_VBE */
>>> -        error_report("qemu: multiboot knows VBE. we don't.");
>>> +        error_report("multiboot knows VBE. we don't.");
> Since this one is intended to be a user-facing error message
> rather than just a debug note, it could also be reasonably expanded
> to be a bit more user friendly, eg:
>   "This multiboot image uses VBE, which QEMU does not support."
>
> But that's a different patch.

OK, I will commit a separate patch for it.

Thanks,
Mao

--------------BC2DF87B1F00B800107BAA85
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On 9/20/18 1:39 PM, Peter Maydell
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAFEAcA_9uqokbJ4mAbZ4h2_YMhLJBYx=f8u+iUcg5VherfKJLw@mail.gmail.com">
      <blockquote type="cite" style="color: #000000;">
        <blockquote type="cite" style="color: #000000;">
          <pre class="moz-quote-pre" wrap="">     if (flags &amp; 0x00000004) { /* MULTIBOOT_HEADER_HAS_VBE */
-        error_report("qemu: multiboot knows VBE. we don't.");
+        error_report("multiboot knows VBE. we don't.");
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Since this one is intended to be a user-facing error message
rather than just a debug note, it could also be reasonably expanded
to be a bit more user friendly, eg:
 "This multiboot image uses VBE, which QEMU does not support."

But that's a different patch.</pre>
    </blockquote>
    <br>
    OK, I will commit a separate patch for it. <br>
    <br>
    Thanks,<br>
    Mao<br>
  </body>
</html>

--------------BC2DF87B1F00B800107BAA85--



