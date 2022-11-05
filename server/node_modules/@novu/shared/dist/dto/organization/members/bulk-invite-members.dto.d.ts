export interface IBulkInviteRequestDto {
    invitees: {
        email: string;
    }[];
}
export interface IBulkInviteResponse {
    success: boolean;
    email: string;
}
//# sourceMappingURL=bulk-invite-members.dto.d.ts.map