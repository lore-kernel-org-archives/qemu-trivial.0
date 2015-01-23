Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YEg3T-0004X4-Bc
	for mharc-qemu-trivial@gnu.org; Fri, 23 Jan 2015 10:21:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51241)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1YEg3Q-0004Wx-Ra
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 10:21:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1YEg3M-0000RM-V8
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 10:21:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36606)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>)
	id 1YEg3M-0000RD-N1; Fri, 23 Jan 2015 10:21:44 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0NFLfWi027665
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 23 Jan 2015 10:21:42 -0500
Received: from dresden.str.redhat.com ([10.18.17.71])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0NFLejZ024585
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Fri, 23 Jan 2015 10:21:40 -0500
Message-ID: <54C26703.7020602@redhat.com>
Date: Fri, 23 Jan 2015 10:21:39 -0500
From: Max Reitz <mreitz@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Julio Faracco <jcfaracco@gmail.com>, qemu-devel@nongnu.org
References: <1421978021-3609-1-git-send-email-jcfaracco@gmail.com>
	<1421978021-3609-2-git-send-email-jcfaracco@gmail.com>
In-Reply-To: <1421978021-3609-2-git-send-email-jcfaracco@gmail.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] qcow2-snapshot: Fixing
 bug of creating snapshots with the same name.
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
X-List-Received-Date: Fri, 23 Jan 2015 15:21:49 -0000

On 2015-01-22 at 20:53, Julio Faracco wrote:
> This commit fixes the bug #1396497. You can create multiple snapshots with
> the same name using 'qemu-img'. When you want to delete someone passing the
> name, it will remove the first occurence of the snapshot with that name.
> This commit fixes it.

I'm not so sure about these patches. Because there is an ID, I'd 
actually expect qemu to be able to create multiple snapshots with the 
same name (as long as the ID is unique for each snapshot).

I think the real problem is that find_snapshot_by_id_and_name() should 
not be successful if there are multiple snapshots which match the given 
ID/name combination (which should not happen if an ID has been given), 
which would prevent qcow2_snapshot_delete() from simply deleting the 
first matching snapshot.

Max

> Before:
> $ qemu-img snapshot -c foo debian.qcow2
> $ qemu-img snapshot -c foo debian.qcow2
> $ qemu-img snapshot -c foo debian.qcow2
> $ qemu-img snapshot -l debian.qcow2
> ID        TAG                 VM SIZE                DATE       VM CLOCK
> 1         foo                    220M 2015-01-21 16:22:41   00:02:50.862
> 2         foo                    130M 2015-01-22 11:14:55   00:00:40.132
> 3         foo                     65M 2015-01-22 11:16:32   00:01:13.414
>
> Now:
> $ qemu-img snapshot -c foo debian.qcow2
> $ qemu-img snapshot -c foo debian.qcow2
> qemu-img: Could not create snapshot 'foo': -17 (File exists)
> $ qemu-img snapshot -l debian.qcow2
> ID        TAG                 VM SIZE                DATE       VM CLOCK
> 1         foo                    220M 2015-01-21 16:22:41   00:02:50.862
>
> Signed-off-by: Julio Faracco <jcfaracco@gmail.com>
> ---
>   block/qcow2-snapshot.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/block/qcow2-snapshot.c b/block/qcow2-snapshot.c
> index c7d4cfe..873ac49 100644
> --- a/block/qcow2-snapshot.c
> +++ b/block/qcow2-snapshot.c
> @@ -356,8 +356,9 @@ int qcow2_snapshot_create(BlockDriverState *bs, QEMUSnapshotInfo *sn_info)
>           find_new_snapshot_id(bs, sn_info->id_str, sizeof(sn_info->id_str));
>       }
>   
> -    /* Check that the ID is unique */
> -    if (find_snapshot_by_id_or_name(bs, sn_info->id_str) >= 0) {
> +    /* Check that the ID and Name is unique */
> +    if (find_snapshot_by_id_or_name(bs, sn_info->id_str) >= 0 ||
> +        find_snapshot_by_id_or_name(bs, sn_info->name) >= 0 ) {
>           return -EEXIST;
>       }
>   


