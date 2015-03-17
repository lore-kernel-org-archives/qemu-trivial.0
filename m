Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXrnx-00042Q-7p
	for mharc-qemu-trivial@gnu.org; Tue, 17 Mar 2015 09:45:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1YXrnu-0003ws-Gb
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 09:45:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1YXrnt-0007AJ-MM
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 09:45:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47283)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>)
	id 1YXrni-0006xt-3t; Tue, 17 Mar 2015 09:44:54 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id AA87FC2FF0;
	Tue, 17 Mar 2015 13:44:53 +0000 (UTC)
Received: from localhost (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2HDiq1i021632; Tue, 17 Mar 2015 09:44:53 -0400
From: Juan Quintela <quintela@redhat.com>
To: Thomas Huth <thuth@linux.vnet.ibm.com>
In-Reply-To: <1426313974-25607-2-git-send-email-thuth@linux.vnet.ibm.com>
	(Thomas Huth's message of "Sat, 14 Mar 2015 07:19:28 +0100")
References: <1426313974-25607-1-git-send-email-thuth@linux.vnet.ibm.com>
	<1426313974-25607-2-git-send-email-thuth@linux.vnet.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
Date: Tue, 17 Mar 2015 14:44:51 +0100
Message-ID: <87h9tjivqk.fsf@neno.neno>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Amit Shah <amit.shah@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2 1/7] migration: Remove unused functions
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
X-List-Received-Date: Tue, 17 Mar 2015 13:45:07 -0000

Thomas Huth <thuth@linux.vnet.ibm.com> wrote:
> migrate_rdma_pin_all(), qsb_clone() and qsb_set_length()
> are completely unused and thus can be deleted.
>
> Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Amit Shah <amit.shah@redhat.com>
>  void migrate_del_blocker(Error *reason);
>  
> -bool migrate_rdma_pin_all(void);

Removed


> diff --git a/include/migration/qemu-file.h b/include/migration/qemu-file.h
> index a923cec..45d7f71 100644
> --- a/include/migration/qemu-file.h
> +++ b/include/migration/qemu-file.h
> @@ -133,9 +133,7 @@ bool qemu_file_mode_is_not_valid(const char *mode);
>  bool qemu_file_is_writable(QEMUFile *f);
>  
>  QEMUSizedBuffer *qsb_create(const uint8_t *buffer, size_t len);
> -QEMUSizedBuffer *qsb_clone(const QEMUSizedBuffer *);

Removed


>  void qsb_free(QEMUSizedBuffer *);
> -size_t qsb_set_length(QEMUSizedBuffer *qsb, size_t length);

Being used in the COLO patches (posted on the list)

Adjusted the removal by hand, thanks.

Applied, thanks.

