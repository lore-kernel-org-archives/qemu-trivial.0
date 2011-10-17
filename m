Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RFliA-0007Yf-SE
	for mharc-qemu-trivial@gnu.org; Mon, 17 Oct 2011 07:50:30 -0400
Received: from eggs.gnu.org ([140.186.70.92]:50338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1RFli4-0007Fj-NW
	for qemu-trivial@nongnu.org; Mon, 17 Oct 2011 07:50:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1RFli3-00004u-I5
	for qemu-trivial@nongnu.org; Mon, 17 Oct 2011 07:50:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:1511)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>)
	id 1RFlhx-0008Vj-0Q; Mon, 17 Oct 2011 07:50:17 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9HBoBZw023760
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 17 Oct 2011 07:50:12 -0400
Received: from localhost (ovpn-116-17.ams2.redhat.com [10.36.116.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p9HBoAkZ001561; Mon, 17 Oct 2011 07:50:10 -0400
From: Juan Quintela <quintela@redhat.com>
To: Dmitry Koshelev <karaghiozis@gmail.com>
In-Reply-To: <CAKUHwZpm+WW2vdM1WjHV+rmYe8mbsP8Ydtnub7UxxxzfMD9m8A@mail.gmail.com>
	(Dmitry Koshelev's message of "Mon, 17 Oct 2011 14:53:28 +0400")
References: <CAKUHwZpm+WW2vdM1WjHV+rmYe8mbsP8Ydtnub7UxxxzfMD9m8A@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
Date: Mon, 17 Oct 2011 13:50:04 +0200
Message-ID: <m3sjmrltw3.fsf@trasno.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, paul@codesourcery.com
Subject: Re: [Qemu-trivial] [PATCH] arm cpu state loading fix
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: quintela@redhat.com
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Oct 2011 11:50:28 -0000

Dmitry Koshelev <karaghiozis@gmail.com> wrote:
> Floating registers loading fix.
>
> Signed-off-by: Dmitry Koshelev <karaghiozis@gmail.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

/me really wonders if arm migration has ever worked :-(

