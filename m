Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U5htM-0003qK-N3
	for mharc-qemu-trivial@gnu.org; Wed, 13 Feb 2013 14:21:16 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1U5htF-0003V8-KW
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2013 14:21:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1U5htD-0002cV-HY
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2013 14:21:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59829)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1U5ht8-0002bJ-1A; Wed, 13 Feb 2013 14:21:02 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r1DJKxWP003921
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 13 Feb 2013 14:20:59 -0500
Received: from localhost (ovpn-113-97.phx2.redhat.com [10.3.113.97])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r1DJKtxT025004; Wed, 13 Feb 2013 14:20:57 -0500
Date: Wed, 13 Feb 2013 17:20:55 -0200
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20130213172055.7c1d4527@redhat.com>
In-Reply-To: <878v6y7g77.fsf@blackfin.pond.sub.org>
References: <1360340232-4670-1-git-send-email-armbru@redhat.com>
	<1360340232-4670-5-git-send-email-armbru@redhat.com>
	<20130208155324.0c456dcc@redhat.com>
	<87sj56d44d.fsf@blackfin.pond.sub.org>
	<20130208171630.3deddd59@redhat.com>
	<878v6y7g77.fsf@blackfin.pond.sub.org>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH for-1.4 v2 4/6] qemu-option: Disable two
 helpful messages that got broken recently
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
X-List-Received-Date: Wed, 13 Feb 2013 19:21:15 -0000

On Fri, 08 Feb 2013 20:34:20 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> > The real problem here is that the k, M, G suffixes, for example, are not
> > good to be reported by QMP. So maybe we should refactor the code in a way
> > that we separate what's done in QMP from what is done in HMP/command-line.
> 
> Isn't it separated already?  parse_option_size() is used when parsing
> key=value,...  Such strings should not exist in QMP.  If they do, it's a
> design bug.

No and no. Such strings don't exist in QMP as far as can tell (see bugs
below though), but parse_option_size() is theoretically "present" in a
possible QMP call stack:

qemu_opts_from_dict_1()
  qemu_opt_set_err()
    opt_set()
      qemu_opt_paser()
        parse_option_size()

I can't tell if this will ever happen because qemu_opts_from_dict_1()
restricts the call to qemu_opt_set_err() to certain values, but the
fact that it's not clear is an indication that a better separation is
necessary.

Now, I think I've found at least two bugs. The first one is the
netdev_add doc in the schema, which states that we do accept key=value
strings. The problem is here is that that's about the C API, on the
wire we act as before (ie. accepting each key as a separate argument).
The qapi-schame.json is more or less format-independent, so I'm not
exactly sure what's the best way to describe commands using QemuOpts
the way QMP uses it.

The second bug is that I entirely ignored how set_option_paramater()
handles errors when doing parse_option_size() conversion to Error **
and also when converting bdrv_img_create(). The end result is that
we can report an error twice, once with error_set() and later with
qerror_report() (or vice-versa). Shouldn't hurt on QMP as it knows
how to deal with this, on HMP and command-line we get complementary
error messages if we're lucky.

I'm very surprised with my mistakes on the second bug (although some
of the mess with fprintf() was already there), but I honestly think we
should defer this to 1.5 (and I can do it myself next week).

